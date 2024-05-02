# ☄️ Markdown Export for (Neo)vim ☄️

**markdown-export.nvim** is a simple wrapper around `Pandoc` to support exporting markdown to various file formats.

## ✨ Features

- [x] Export to `HTML`
- [x] Export to `PDF`
- [ ] Export to `DOCX`

## ⚡Requirements

- Neovim >= 0.8.0 (built with **LuaJIT**)
- [Pandoc](https://pandoc.org/installing.html)
- [wkhtmltopdf](https://wkhtmltopdf.org/)

## 📦 Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    "marcobuess/markdown-export.nvim",
    opts = {}
}

```

## ⚙️ Configuration

```lua
{
  stylesheet = "" -- Path to custom css stylesheet. Uses /css/styles.css by default
}
```

## 🚀 Usage

|Command|Description|
|-------|-----------|
|`:MarkdownExport html`|Exports file as html|
|`:MarkdownExport pdf`|Exports file as pdf|

## 🛠️ Other Markdown Tools

- [markmap.nvim](https://github.com/Zeioth/markmap.nvim)
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
