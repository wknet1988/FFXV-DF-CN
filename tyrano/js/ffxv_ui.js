/* ==========================================================================
   FFXV UI 运行时补丁  ——  FINAL FANTASY XV The Dawn of the Future
   --------------------------------------------------------------------------
   消息窗底部的剧情控制按钮（TITLE / SAVE / LOAD / CONFIG / AUTO / SKIP）由
   [button role=...] 建在 fix 层上。引擎读档时会用存档里的 layer_fix 整段替换
   DOM（kag.layer.setLayerHtml），因此早期存档（还没有这些按钮、或只有 AUTO/SKIP）
   读档后按钮会缺失，且本会话内不再出现。这里在 load-beforemaking 时逐个检查
   并补建缺失的按钮，做到幂等（已存在就跳过，绝不重复创建）。
   ========================================================================== */
(function () {
    // marker：用于判断该按钮是否已存在。AUTO/SKIP 激活时 src 会换成 *_on.png，
    // 所以用固定 class（button-auto-sync / button-skip-sync）判断更稳；
    // 其余按钮 src 不变，直接按文件名匹配。
    var CONTROLS = [
        { graphic: "ui_btn_title.png", enterimg: "ui_btn_title_hover.png", autoimg: "", skipimg: "", role: "title",     storage: "",          x: "784",  marker: 'img[src*="ui_btn_title.png"]' },
        { graphic: "ui_btn_save.png",   enterimg: "ui_btn_save_hover.png",   autoimg: "", skipimg: "", role: "save",      storage: "",          x: "858",  marker: 'img[src*="ui_btn_save.png"]' },
        { graphic: "ui_btn_load.png",   enterimg: "ui_btn_load_hover.png",   autoimg: "", skipimg: "", role: "load",      storage: "",          x: "932",  marker: 'img[src*="ui_btn_load.png"]' },
        { graphic: "ui_btn_config.png", enterimg: "ui_btn_config_hover.png", autoimg: "", skipimg: "", role: "sleepgame", storage: "config.ks", x: "1006", marker: 'img[src*="ui_btn_config.png"]' },
        { graphic: "ui_btn_auto.png",   enterimg: "ui_btn_auto_hover.png",   autoimg: "ui_btn_auto_on.png", skipimg: "", role: "auto", storage: "", x: "1080", marker: ".button-auto-sync" },
        { graphic: "ui_btn_skip.png",   enterimg: "ui_btn_skip_hover.png",   autoimg: "", skipimg: "ui_btn_skip_on.png", role: "skip", storage: "", x: "1154", marker: ".button-skip-sync" }
    ];

    function addControls() {
        try {
            var kag = window.TYRANO && window.TYRANO.kag;
            if (!kag || !kag.ftag || !kag.ftag.startTag) return;

            // [button] 的 start() 结尾会调用 nextOrder()。补建按钮不参与脚本推进，
            // 临时屏蔽 nextOrder，避免打乱读档后正要恢复的执行位置。
            var ftag = kag.ftag;
            var origNext = ftag.nextOrder;
            ftag.nextOrder = function () {};
            try {
                for (var i = 0; i < CONTROLS.length; i++) {
                    var c = CONTROLS[i];
                    if (document.querySelector(c.marker)) continue; // 已存在，跳过
                    ftag.startTag("button", {
                        graphic: c.graphic,
                        enterimg: c.enterimg,
                        autoimg: c.autoimg || "",
                        skipimg: c.skipimg || "",
                        role: c.role,
                        storage: c.storage || "",
                        fix: "true",
                        folder: "image",
                        x: c.x,
                        y: "690",
                        width: "62",
                        height: "24",
                        visible: "true"
                    });
                }
            } finally {
                ftag.nextOrder = origNext;
            }
        } catch (e) {
            /* 补丁不应影响游戏本体流程 */
        }
    }

    /* --------------------------------------------------------------------------
       回车翻页对齐鼠标点击
       --------------------------------------------------------------------------
       引擎默认把回车(13)映射到 "next" 标签，直接调 nextOrder()。
       nextOrder() 在 is_adding_text（打字机动画中）/ is_strong_stop 时会直接
       return —— 于是「文字还在打字时按回车」看似没反应，等显示完再按才翻页，
       用户感知为「回车有时不起作用」。

       鼠标点击走的是 .layer_event_click 的 click 处理器，它会在打字中先置
       is_click_text 把字补完、并正确处理 is_hide_message / is_stop 等状态。
       这里把回车也路由到同一条 click 路径，使回车与鼠标行为完全一致。
       （引擎的 keyCode 表里存的是数字 13，同时覆盖 "Enter" 以防个别浏览器
        e.key 不一致；getAction 优先取 e.key。）
       -------------------------------------------------------------------------- */
    function installEnterAsClick() {
        var kag = window.TYRANO && window.TYRANO.kag;
        if (!kag || !kag.key_mouse || !kag.key_mouse.map_key) return false;
        var km = kag.key_mouse;
        if (km.map_key[13] && km.map_key[13].__ffxv_enter) return true; // 已安装

        function handler() {
            var layer = km.j_event_layer;
            if (layer && layer.length) {
                try { layer.trigger("click"); return; } catch (e) {}
            }
            // 兜底：事件层不可用（极早阶段）时退化为原 next 行为
            try { kag.ftag.nextOrder(); } catch (e) {}
        }
        handler.__ffxv_enter = true;

        km.map_key[13] = handler;
        km.map_key["Enter"] = handler;
        return true;
    }

    var tries = 0, loadBound = false, enterTries = 0;
    function bind() {
        var kag = window.TYRANO && window.TYRANO.kag;
        if (kag && kag.on) {
            if (!loadBound) { kag.on("load-beforemaking", addControls); loadBound = true; }
            // key_mouse.map_key 可能在 kag.on 就绪之后才初始化（插件 init 顺序），
            // 因此轮询直到真正装上，避免偶发没装上导致回车仍走旧路径。
            if (installEnterAsClick()) return;
            if (enterTries++ < 120) setTimeout(bind, 100);
            return;
        }
        if (tries++ < 60) setTimeout(bind, 250);
    }

    bind();
})();
