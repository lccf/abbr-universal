# abbr-universal

[English](#english) | [中文](#chinese)

<a name="english"></a>
## English

A Fish shell plugin that helps you manage universal abbreviations by automatically saving them to your config.fish file.

### Features

- Add and remove abbreviations that persist across sessions
- Automatically saves abbreviations to your config.fish file
- Supports command completion
- Simple and easy to use interface

### Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install lccf/abbr-universal
```

### Usage

```fish
# Add a new abbreviation
abbr_universal add <abbreviation_name> <abbreviation_value>

# Remove an existing abbreviation
abbr_universal remove <abbreviation_name>
```

### Examples

```fish
# Add an abbreviation for 'git status'
abbr_universal add gs 'git status'

# Add an abbreviation for 'docker compose up'
abbr_universal add dcu 'docker compose up'

# Remove an abbreviation
abbr_universal remove gs
```

<a name="chinese"></a>
## 中文

一个Fish shell插件，通过自动将缩写保存到config.fish文件中来帮助你管理通用缩写。

### 特性

- 添加和删除在会话之间持久保存的缩写
- 自动将缩写保存到config.fish文件中
- 支持命令补全
- 简单易用的接口

### 安装

使用 [Fisher](https://github.com/jorgebucaran/fisher) 安装：

```fish
fisher install lccf/abbr-universal
```

### 使用方法

```fish
# 添加新的缩写
abbr_universal add <缩写名称> <缩写值>

# 删除已存在的缩写
abbr_universal remove <缩写名称>
```

### 示例

```fish
# 添加'git status'的缩写
abbr_universal add gs 'git status'

# 添加'docker compose up'的缩写
abbr_universal add dcu 'docker compose up'

# 删除缩写
abbr_universal remove gs
```

---

*由 Trae AI 生成*