# 最终幻想 XV：未来黎明（FINAL FANTASY XV - The Dawn of the Future / CN）

一个基于 [TyranoBuilder / TyranoScript](https://tyrano.jp/) 制作的《最终幻想 XV》同人视觉小说（中文）。

## 简介

本项目是《最终幻想15：未来黎明》的四章主线 + 番外剧情同人作品，使用 TyranoBuilder 4.50 构建，
舞台分辨率 1280×720。包含标题界面、章节选择、自动/快进/存档/读档/设置等完整 UI（FFXV 暗色 + 琥珀风格）。

## 目录结构

- `index.html` — 游戏入口
- `data/` — 剧本（`.ks`）、背景（`.jpg`）、立绘（`.png`）、字体、BGM、片头视频
- `tyrano/` — TyranoScript 引擎与 FFXV 风格化 UI（CSS/JS）
- `builder_config.json` / `package.json` — 工程配置

> 片头视频 `data/video/wedding.ogv`（约 108MB）通过 Git LFS 管理，clone 时请确保已安装 Git LFS。

## 运行方式

### 方式一：本地 Web 服务器（推荐，开发/预览）

游戏通过 `fetch` 加载剧本，需经 HTTP 提供（不能用 `file://` 直接打开）。在本仓库根目录起一个静态服务器即可，例如：

```bash
python -m http.server 8080
# 浏览器打开 http://localhost:8080
```

### 方式二：Windows 64 位独立包体

仓库不含打包产物。构建脚本见 `.workbuddy/export_win64.js`（依赖 TyranoBuilder 本体内建打包链），
运行后于 `../TyranoBuilder/export/win64_*/` 生成可双击运行的 `.exe`，资源全部打入 `app.asar`。

## 免责声明

本作为非商业同人二次创作，仅供粉丝交流学习。**《FINAL FANTASY》系列角色、剧情、美术、音乐等版权
均归 Square Enix 所有**。相关素材仅用于同人创作，不代表官方立场。如权利人提出异议，将立即下架相关资源。

## 许可

剧本文本与定制化代码（`.ks` / 自定义 CSS / JS）以本项目为准；第三方素材版权归原权利人所有。
