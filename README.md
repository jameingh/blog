## 部署说明

部署脚本是publish.sh，在项目根目录下运行

```shell
sh publish.sh
```

不建议使用``hexo d``命令部署，因为该命令会每次将整个发布文件夹删掉，然后重新拷贝。不是增量拷贝！！！

## 主题切换
使用obsidian主题，需要把根目录的_config.yml中的高亮配置关闭

```yaml
highlight:
  enable: false
  line_number: true
  auto_detect: false
  tab_replace: ''
  wrap: true
  hljs: false
```

如果切换回stun主题，需要注意，把高亮主题配置改回来