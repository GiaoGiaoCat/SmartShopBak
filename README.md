# README

它开发的初衷是能在 **微信** **百度轻应用** **UC平台** 上简单的搭建搭建一款单用户商城。

你可以自由的更改代码本地跑着玩，但因为所使用的 theme 是购买的，如果部署供人使用你可能会因为这个问题侵权哦。

## Ruby version

* ruby >= 2.0.0-p0
* rails >= 4.0.2

## System dependencies

## Configuration

```ruby
touch config/initializers/secrets.yml
rake secret
then config your `secret_key_base`
```
## Database creation

## Database initialization

## How to run the test suite

## Services (job queues, cache servers, search engines, etc.)

## Deployment instructions

### 配置开发习惯文件

此文件不纳入版本控制

```ruby
touch /config/initializers/dev_config.rb
then edit it...

# example:
# Read: http://guides.rubyonrails.org/generators.html#customizing-your-workflow
SmartShop::Application.config.generators do |g|
  g.test_framework  false
  g.stylesheets     false
  # g.javascripts     false
  # g.helpers         false
end
```


### Github Issues 用法注意

**Bug报告分类**

* 待确认的（Unconfirmed）
* 新提交的（New）
* 已分配的（Assigned）
* 问题未解决的（Reopened）
* 待返测的（Resolved）
* 待归档的（Verified）
* 已归档的（Closed）

**标签解释**

* 已修好（Fixed）
* 某功能无效（Invalid）
* 未修补的已知问题（Wontfix）
* 以后版本解决（Later）
* 留意此问题（Remind）
* 被重现的问题（Duplicate）
* 无法重现（Worksforme）
* 改善（Enhancement）
* 功能（Feature）
* 推迟的功能（Deferred）

如果有其他自定义标签请补充此文档

### Comment 相关知识

* **TODO** 暂缺的功能和函数，稍后需要增加
* **FIXME** 需要修复的代码
* **OPTIMIZE** 慢或者效率低的代码可能会引起性能问题
* **HACK** 应该重构的，有问题的编码实践
* **REVIEW** 需要特别关注，确认这段代码能按照期望的正常工作 ```For example: REVIEW: Are we sure this is how the client does X currently?```
* 可以使用其他关键词，但是需要在这里标注上

### 编码规范

* [Rails 3.2 Development Standards Guide](https://github.com/xiongbo/rails_standards)
* [A community-driven Rails 3 & 4 style guide](https://github.com/bbatsov/rails-style-guide)
* [A community-driven Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide)
* [Ruby Development Bookmarks](https://github.com/saberma/ruby-dev-bookmarks)

### GEM

* [cocoon](https://github.com/nathanvda/cocoon)
* [Simple Form](https://github.com/plataformatec/simple_form/)

### 参考
* [spree](https://github.com/spree/spree)
