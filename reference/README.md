<html class="no-js" lang="en">
  <head>
    <title>Process Engine HTTP REST API | API Reference</title> <style>/*! normalize-scss | MIT/GPLv2 License | bit.ly/normalize-scss */audio,canvas,img,progress,video{display:inline-block}progress,sub,sup{vertical-align:baseline}pre,textarea{overflow:auto}body,button,legend{padding:0}.small-pull-1,.small-pull-10,.small-pull-11,.small-pull-2,.small-pull-3,.small-pull-4,.small-pull-5,.small-pull-6,.small-pull-7,.small-pull-8,.small-pull-9,.small-push-1,.small-push-10,.small-push-11,.small-push-2,.small-push-3,.small-push-4,.small-push-5,.small-push-7,.small-push-8,.small-push-9,sub,sup{position:relative}h1,h2,h3,h4,h5,h6,p{text-rendering:optimizeLegibility}button,hr,input{overflow:visible}a,abbr,abbr[title]{text-decoration:none}html{font-family:sans-serif;line-height:1.15;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}code,kbd,pre,samp{font-family:monospace,monospace;font-size:1em}article,aside,details,figcaption,figure,footer,header,main,menu,nav,section{display:block}a:active,a:hover{outline-width:0}dfn{font-style:italic}mark{background-color:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0}sub{bottom:-.25em}sup{top:-.5em}audio:not([controls]){display:none;height:0}img{border-style:none;vertical-align:middle;max-width:100%;height:auto;-ms-interpolation-mode:bicubic}svg:not(:root){overflow:hidden}button,input,optgroup,select,textarea{font-size:100%;line-height:1.15;margin:0}button,select{text-transform:none}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}[type=button]::-moz-focus-inner,[type=reset]::-moz-focus-inner,[type=submit]::-moz-focus-inner,button::-moz-focus-inner{border-style:none;padding:0}[type=button]:-moz-focusring,[type=reset]:-moz-focusring,[type=submit]:-moz-focusring,button:-moz-focusring{outline:ButtonText dotted 1px}[type=checkbox],[type=radio]{box-sizing:border-box;padding:0}[type=number]::-webkit-inner-spin-button,[type=number]::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}[data-whatinput=mouse] .button,[data-whatinput=mouse] .close-button,[data-whatinput=mouse] button,select:focus{outline:0}[type=search]::-webkit-search-cancel-button,[type=search]::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}a,b,em,i,small,strong{line-height:inherit}dl,ol,p,ul{line-height:1.6}legend{box-sizing:border-box;display:table;color:inherit;white-space:normal}summary{display:list-item}[hidden],template{display:none}.foundation-mq{font-family:"small=0em&medium=40em&large=64em&xlarge=75em&xxlarge=90em"}html{box-sizing:border-box;font-size:95%}*,::after,::before{box-sizing:inherit}body{margin:0;background:#fefefe;font-family:"Helvetica Neue",Helvetica,Roboto,Arial,sans-serif;font-weight:400;line-height:1.5;color:#23241f;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}select{box-sizing:border-box;width:100%}.map_canvas embed,.map_canvas img,.map_canvas object,.mqa-display embed,.mqa-display img,.mqa-display object{max-width:none!important}button{appearance:none;border:0;border-radius:0;background:0 0;line-height:1}button,input,optgroup,select,textarea{font-family:inherit}.is-visible{display:block!important}.is-hidden{display:none!important}.row{max-width:auto;margin-right:auto;margin-left:auto}.row.expanded,.row:not(.expanded) .row{max-width:none}.row::after,.row::before{display:table;content:' ';flex-basis:0;order:1}.row::after{clear:both}.row.collapse>.column,.row.collapse>.columns{padding-right:0;padding-left:0}.row .row{margin-right:-.6578947368rem;margin-left:-.6578947368rem}@media print,screen and (min-width:40em){.row .row{margin-right:-.9868421053rem;margin-left:-.9868421053rem}}@media print,screen and (min-width:64em){.row .row{margin-right:-.9868421053rem;margin-left:-.9868421053rem}}.row .row.collapse{margin-right:0;margin-left:0}.row.expanded .row{margin-right:auto;margin-left:auto}.row.gutter-small>.column,.row.gutter-small>.columns{padding-right:.6578947368rem;padding-left:.6578947368rem}.row.gutter-medium>.column,.row.gutter-medium>.columns{padding-right:.9868421053rem;padding-left:.9868421053rem}.column,.columns{width:100%;float:left;padding-right:.6578947368rem;padding-left:.6578947368rem}@media print,screen and (min-width:40em){.column,.columns{padding-right:.9868421053rem;padding-left:.9868421053rem}}.column:last-child:not(:first-child),.columns:last-child:not(:first-child){float:right}.column.end:last-child:last-child,.end.columns:last-child:last-child{float:left}.column.row.row,.row.row.columns{float:none}.row .column.row.row,.row .row.row.columns{margin-right:0;margin-left:0;padding-right:0;padding-left:0}.small-1{width:8.3333333333%}.small-push-1{left:8.3333333333%}.small-pull-1{left:-8.3333333333%}.small-offset-0{margin-left:0}.small-2{width:16.6666666667%}.small-push-2{left:16.6666666667%}.small-pull-2{left:-16.6666666667%}.small-offset-1{margin-left:8.3333333333%}.small-3{width:25%}.small-push-3{left:25%}.small-pull-3{left:-25%}.small-offset-2{margin-left:16.6666666667%}.small-4{width:33.3333333333%}.small-push-4{left:33.3333333333%}.small-pull-4{left:-33.3333333333%}.small-offset-3{margin-left:25%}.small-5{width:41.6666666667%}.small-push-5{left:41.6666666667%}.small-pull-5{left:-41.6666666667%}.small-offset-4{margin-left:33.3333333333%}.small-6{width:50%}.small-push-6{position:relative;left:50%}.small-pull-6{left:-50%}.small-offset-5{margin-left:41.6666666667%}.small-7{width:58.3333333333%}.small-push-7{left:58.3333333333%}.small-pull-7{left:-58.3333333333%}.small-offset-6{margin-left:50%}.small-8{width:66.6666666667%}.small-push-8{left:66.6666666667%}.small-pull-8{left:-66.6666666667%}.small-offset-7{margin-left:58.3333333333%}.small-9{width:75%}.small-push-9{left:75%}.small-pull-9{left:-75%}.small-offset-8{margin-left:66.6666666667%}.small-10{width:83.3333333333%}.small-push-10{left:83.3333333333%}.small-pull-10{left:-83.3333333333%}.small-offset-9{margin-left:75%}.small-11{width:91.6666666667%}.small-push-11{left:91.6666666667%}.small-pull-11{left:-91.6666666667%}.small-offset-10{margin-left:83.3333333333%}.small-12{width:100%}.small-offset-11{margin-left:91.6666666667%}.small-up-1>.column,.small-up-1>.columns{float:left;width:100%}.small-up-1>.column:nth-of-type(1n),.small-up-1>.columns:nth-of-type(1n){clear:none}.small-up-1>.column:nth-of-type(1n+1),.small-up-1>.columns:nth-of-type(1n+1){clear:both}.small-up-1>.column:last-child,.small-up-1>.columns:last-child{float:left}.small-up-2>.column,.small-up-2>.columns{float:left;width:50%}.small-up-2>.column:nth-of-type(1n),.small-up-2>.columns:nth-of-type(1n){clear:none}.small-up-2>.column:nth-of-type(2n+1),.small-up-2>.columns:nth-of-type(2n+1){clear:both}.small-up-2>.column:last-child,.small-up-2>.columns:last-child{float:left}.small-up-3>.column,.small-up-3>.columns{float:left;width:33.3333333333%}.small-up-3>.column:nth-of-type(1n),.small-up-3>.columns:nth-of-type(1n){clear:none}.small-up-3>.column:nth-of-type(3n+1),.small-up-3>.columns:nth-of-type(3n+1){clear:both}.small-up-3>.column:last-child,.small-up-3>.columns:last-child{float:left}.small-up-4>.column,.small-up-4>.columns{float:left;width:25%}.small-up-4>.column:nth-of-type(1n),.small-up-4>.columns:nth-of-type(1n){clear:none}.small-up-4>.column:nth-of-type(4n+1),.small-up-4>.columns:nth-of-type(4n+1){clear:both}.small-up-4>.column:last-child,.small-up-4>.columns:last-child{float:left}.small-up-5>.column,.small-up-5>.columns{float:left;width:20%}.small-up-5>.column:nth-of-type(1n),.small-up-5>.columns:nth-of-type(1n){clear:none}.small-up-5>.column:nth-of-type(5n+1),.small-up-5>.columns:nth-of-type(5n+1){clear:both}.small-up-5>.column:last-child,.small-up-5>.columns:last-child{float:left}.small-up-6>.column,.small-up-6>.columns{float:left;width:16.6666666667%}.small-up-6>.column:nth-of-type(1n),.small-up-6>.columns:nth-of-type(1n){clear:none}.small-up-6>.column:nth-of-type(6n+1),.small-up-6>.columns:nth-of-type(6n+1){clear:both}.small-up-6>.column:last-child,.small-up-6>.columns:last-child{float:left}.small-up-7>.column,.small-up-7>.columns{float:left;width:14.2857142857%}.small-up-7>.column:nth-of-type(1n),.small-up-7>.columns:nth-of-type(1n){clear:none}.small-up-7>.column:nth-of-type(7n+1),.small-up-7>.columns:nth-of-type(7n+1){clear:both}.small-up-7>.column:last-child,.small-up-7>.columns:last-child{float:left}.small-up-8>.column,.small-up-8>.columns{float:left;width:12.5%}.small-up-8>.column:nth-of-type(1n),.small-up-8>.columns:nth-of-type(1n){clear:none}.small-up-8>.column:nth-of-type(8n+1),.small-up-8>.columns:nth-of-type(8n+1){clear:both}.small-up-8>.column:last-child,.small-up-8>.columns:last-child{float:left}.small-collapse>.column,.small-collapse>.columns{padding-right:0;padding-left:0}.expanded.row .small-collapse.row,.small-collapse .row{margin-right:0;margin-left:0}.small-uncollapse>.column,.small-uncollapse>.columns{padding-right:.6578947368rem;padding-left:.6578947368rem}.small-centered{margin-right:auto;margin-left:auto}.small-centered,.small-centered:last-child:not(:first-child){float:none;clear:both}.small-pull-0,.small-push-0,.small-uncentered{position:static;float:left;margin-right:0;margin-left:0}@media print,screen and (min-width:40em){.medium-pull-1,.medium-pull-10,.medium-pull-11,.medium-pull-2,.medium-pull-3,.medium-pull-4,.medium-pull-5,.medium-pull-6,.medium-pull-7,.medium-pull-8,.medium-pull-9,.medium-push-1,.medium-push-10,.medium-push-11,.medium-push-2,.medium-push-3,.medium-push-4,.medium-push-5,.medium-push-7,.medium-push-8,.medium-push-9{position:relative}.medium-1{width:8.3333333333%}.medium-push-1{left:8.3333333333%}.medium-pull-1{left:-8.3333333333%}.medium-offset-0{margin-left:0}.medium-2{width:16.6666666667%}.medium-push-2{left:16.6666666667%}.medium-pull-2{left:-16.6666666667%}.medium-offset-1{margin-left:8.3333333333%}.medium-3{width:25%}.medium-push-3{left:25%}.medium-pull-3{left:-25%}.medium-offset-2{margin-left:16.6666666667%}.medium-4{width:33.3333333333%}.medium-push-4{left:33.3333333333%}.medium-pull-4{left:-33.3333333333%}.medium-offset-3{margin-left:25%}.medium-5{width:41.6666666667%}.medium-push-5{left:41.6666666667%}.medium-pull-5{left:-41.6666666667%}.medium-offset-4{margin-left:33.3333333333%}.medium-6{width:50%}.medium-push-6{position:relative;left:50%}.medium-pull-6{left:-50%}.medium-offset-5{margin-left:41.6666666667%}.medium-7{width:58.3333333333%}.medium-push-7{left:58.3333333333%}.medium-pull-7{left:-58.3333333333%}.medium-offset-6{margin-left:50%}.medium-8{width:66.6666666667%}.medium-push-8{left:66.6666666667%}.medium-pull-8{left:-66.6666666667%}.medium-offset-7{margin-left:58.3333333333%}.medium-9{width:75%}.medium-push-9{left:75%}.medium-pull-9{left:-75%}.medium-offset-8{margin-left:66.6666666667%}.medium-10{width:83.3333333333%}.medium-push-10{left:83.3333333333%}.medium-pull-10{left:-83.3333333333%}.medium-offset-9{margin-left:75%}.medium-11{width:91.6666666667%}.medium-push-11{left:91.6666666667%}.medium-pull-11{left:-91.6666666667%}.medium-offset-10{margin-left:83.3333333333%}.medium-12{width:100%}.medium-offset-11{margin-left:91.6666666667%}.medium-up-1>.column,.medium-up-1>.columns{float:left;width:100%}.medium-up-1>.column:nth-of-type(1n),.medium-up-1>.columns:nth-of-type(1n){clear:none}.medium-up-1>.column:nth-of-type(1n+1),.medium-up-1>.columns:nth-of-type(1n+1){clear:both}.medium-up-1>.column:last-child,.medium-up-1>.columns:last-child{float:left}.medium-up-2>.column,.medium-up-2>.columns{float:left;width:50%}.medium-up-2>.column:nth-of-type(1n),.medium-up-2>.columns:nth-of-type(1n){clear:none}.medium-up-2>.column:nth-of-type(2n+1),.medium-up-2>.columns:nth-of-type(2n+1){clear:both}.medium-up-2>.column:last-child,.medium-up-2>.columns:last-child{float:left}.medium-up-3>.column,.medium-up-3>.columns{float:left;width:33.3333333333%}.medium-up-3>.column:nth-of-type(1n),.medium-up-3>.columns:nth-of-type(1n){clear:none}.medium-up-3>.column:nth-of-type(3n+1),.medium-up-3>.columns:nth-of-type(3n+1){clear:both}.medium-up-3>.column:last-child,.medium-up-3>.columns:last-child{float:left}.medium-up-4>.column,.medium-up-4>.columns{float:left;width:25%}.medium-up-4>.column:nth-of-type(1n),.medium-up-4>.columns:nth-of-type(1n){clear:none}.medium-up-4>.column:nth-of-type(4n+1),.medium-up-4>.columns:nth-of-type(4n+1){clear:both}.medium-up-4>.column:last-child,.medium-up-4>.columns:last-child{float:left}.medium-up-5>.column,.medium-up-5>.columns{float:left;width:20%}.medium-up-5>.column:nth-of-type(1n),.medium-up-5>.columns:nth-of-type(1n){clear:none}.medium-up-5>.column:nth-of-type(5n+1),.medium-up-5>.columns:nth-of-type(5n+1){clear:both}.medium-up-5>.column:last-child,.medium-up-5>.columns:last-child{float:left}.medium-up-6>.column,.medium-up-6>.columns{float:left;width:16.6666666667%}.medium-up-6>.column:nth-of-type(1n),.medium-up-6>.columns:nth-of-type(1n){clear:none}.medium-up-6>.column:nth-of-type(6n+1),.medium-up-6>.columns:nth-of-type(6n+1){clear:both}.medium-up-6>.column:last-child,.medium-up-6>.columns:last-child{float:left}.medium-up-7>.column,.medium-up-7>.columns{float:left;width:14.2857142857%}.medium-up-7>.column:nth-of-type(1n),.medium-up-7>.columns:nth-of-type(1n){clear:none}.medium-up-7>.column:nth-of-type(7n+1),.medium-up-7>.columns:nth-of-type(7n+1){clear:both}.medium-up-7>.column:last-child,.medium-up-7>.columns:last-child{float:left}.medium-up-8>.column,.medium-up-8>.columns{float:left;width:12.5%}.medium-up-8>.column:nth-of-type(1n),.medium-up-8>.columns:nth-of-type(1n){clear:none}.medium-up-8>.column:nth-of-type(8n+1),.medium-up-8>.columns:nth-of-type(8n+1){clear:both}.medium-up-8>.column:last-child,.medium-up-8>.columns:last-child{float:left}.medium-collapse>.column,.medium-collapse>.columns{padding-right:0;padding-left:0}.expanded.row .medium-collapse.row,.medium-collapse .row{margin-right:0;margin-left:0}.medium-uncollapse>.column,.medium-uncollapse>.columns{padding-right:.9868421053rem;padding-left:.9868421053rem}.medium-centered{margin-right:auto;margin-left:auto}.medium-centered,.medium-centered:last-child:not(:first-child){float:none;clear:both}.medium-pull-0,.medium-push-0,.medium-uncentered{position:static;float:left;margin-right:0;margin-left:0}}@media print,screen and (min-width:64em){.large-pull-1,.large-pull-10,.large-pull-11,.large-pull-2,.large-pull-3,.large-pull-4,.large-pull-5,.large-pull-6,.large-pull-7,.large-pull-8,.large-pull-9,.large-push-1,.large-push-10,.large-push-11,.large-push-2,.large-push-3,.large-push-4,.large-push-5,.large-push-7,.large-push-8,.large-push-9{position:relative}.large-1{width:8.3333333333%}.large-push-1{left:8.3333333333%}.large-pull-1{left:-8.3333333333%}.large-offset-0{margin-left:0}.large-2{width:16.6666666667%}.large-push-2{left:16.6666666667%}.large-pull-2{left:-16.6666666667%}.large-offset-1{margin-left:8.3333333333%}.large-3{width:25%}.large-push-3{left:25%}.large-pull-3{left:-25%}.large-offset-2{margin-left:16.6666666667%}.large-4{width:33.3333333333%}.large-push-4{left:33.3333333333%}.large-pull-4{left:-33.3333333333%}.large-offset-3{margin-left:25%}.large-5{width:41.6666666667%}.large-push-5{left:41.6666666667%}.large-pull-5{left:-41.6666666667%}.large-offset-4{margin-left:33.3333333333%}.large-6{width:50%}.large-push-6{position:relative;left:50%}.large-pull-6{left:-50%}.large-offset-5{margin-left:41.6666666667%}.large-7{width:58.3333333333%}.large-push-7{left:58.3333333333%}.large-pull-7{left:-58.3333333333%}.large-offset-6{margin-left:50%}.large-8{width:66.6666666667%}.large-push-8{left:66.6666666667%}.large-pull-8{left:-66.6666666667%}.large-offset-7{margin-left:58.3333333333%}.large-9{width:75%}.large-push-9{left:75%}.large-pull-9{left:-75%}.large-offset-8{margin-left:66.6666666667%}.large-10{width:83.3333333333%}.large-push-10{left:83.3333333333%}.large-pull-10{left:-83.3333333333%}.large-offset-9{margin-left:75%}.large-11{width:91.6666666667%}.large-push-11{left:91.6666666667%}.large-pull-11{left:-91.6666666667%}.large-offset-10{margin-left:83.3333333333%}.large-12{width:100%}.large-offset-11{margin-left:91.6666666667%}.large-up-1>.column,.large-up-1>.columns{float:left;width:100%}.large-up-1>.column:nth-of-type(1n),.large-up-1>.columns:nth-of-type(1n){clear:none}.large-up-1>.column:nth-of-type(1n+1),.large-up-1>.columns:nth-of-type(1n+1){clear:both}.large-up-1>.column:last-child,.large-up-1>.columns:last-child{float:left}.large-up-2>.column,.large-up-2>.columns{float:left;width:50%}.large-up-2>.column:nth-of-type(1n),.large-up-2>.columns:nth-of-type(1n){clear:none}.large-up-2>.column:nth-of-type(2n+1),.large-up-2>.columns:nth-of-type(2n+1){clear:both}.large-up-2>.column:last-child,.large-up-2>.columns:last-child{float:left}.large-up-3>.column,.large-up-3>.columns{float:left;width:33.3333333333%}.large-up-3>.column:nth-of-type(1n),.large-up-3>.columns:nth-of-type(1n){clear:none}.large-up-3>.column:nth-of-type(3n+1),.large-up-3>.columns:nth-of-type(3n+1){clear:both}.large-up-3>.column:last-child,.large-up-3>.columns:last-child{float:left}.large-up-4>.column,.large-up-4>.columns{float:left;width:25%}.large-up-4>.column:nth-of-type(1n),.large-up-4>.columns:nth-of-type(1n){clear:none}.large-up-4>.column:nth-of-type(4n+1),.large-up-4>.columns:nth-of-type(4n+1){clear:both}.large-up-4>.column:last-child,.large-up-4>.columns:last-child{float:left}.large-up-5>.column,.large-up-5>.columns{float:left;width:20%}.large-up-5>.column:nth-of-type(1n),.large-up-5>.columns:nth-of-type(1n){clear:none}.large-up-5>.column:nth-of-type(5n+1),.large-up-5>.columns:nth-of-type(5n+1){clear:both}.large-up-5>.column:last-child,.large-up-5>.columns:last-child{float:left}.large-up-6>.column,.large-up-6>.columns{float:left;width:16.6666666667%}.large-up-6>.column:nth-of-type(1n),.large-up-6>.columns:nth-of-type(1n){clear:none}.large-up-6>.column:nth-of-type(6n+1),.large-up-6>.columns:nth-of-type(6n+1){clear:both}.large-up-6>.column:last-child,.large-up-6>.columns:last-child{float:left}.large-up-7>.column,.large-up-7>.columns{float:left;width:14.2857142857%}.large-up-7>.column:nth-of-type(1n),.large-up-7>.columns:nth-of-type(1n){clear:none}.large-up-7>.column:nth-of-type(7n+1),.large-up-7>.columns:nth-of-type(7n+1){clear:both}.large-up-7>.column:last-child,.large-up-7>.columns:last-child{float:left}.large-up-8>.column,.large-up-8>.columns{float:left;width:12.5%}.large-up-8>.column:nth-of-type(1n),.large-up-8>.columns:nth-of-type(1n){clear:none}.large-up-8>.column:nth-of-type(8n+1),.large-up-8>.columns:nth-of-type(8n+1){clear:both}.large-up-8>.column:last-child,.large-up-8>.columns:last-child{float:left}.large-collapse>.column,.large-collapse>.columns{padding-right:0;padding-left:0}.expanded.row .large-collapse.row,.large-collapse .row{margin-right:0;margin-left:0}.large-uncollapse>.column,.large-uncollapse>.columns{padding-right:.9868421053rem;padding-left:.9868421053rem}.large-centered{margin-right:auto;margin-left:auto}.large-centered,.large-centered:last-child:not(:first-child){float:none;clear:both}.large-pull-0,.large-push-0,.large-uncentered{position:static;float:left;margin-right:0;margin-left:0}}.clearfix::after,hr{clear:both}.column-block{margin-bottom:1.3157894737rem}.column-block>:last-child{margin-bottom:0}@media print,screen and (min-width:40em){.column-block{margin-bottom:1.9736842105rem}.column-block>:last-child{margin-bottom:0}}figure,kbd{margin:0}blockquote,dd,div,dl,dt,form,h1,h2,h3,h4,h5,h6,li,ol,p,pre,td,th,ul{margin:0;padding:0}h1,h2,h3,h4,h5,h6{line-height:1.4;margin-top:0;margin-bottom:.5rem}ol,ul{margin-left:1.25rem}dl,ol,p,ul{margin-bottom:1rem}p{font-size:inherit}em,i{font-style:italic}b,strong{font-weight:700}h1,h2,h3,h4,h5,h6{font-family:"Helvetica Neue",Helvetica,Roboto,Arial,sans-serif;font-style:normal;font-weight:400;color:inherit}code,kbd{background-color:#e6e6e6;font-family:Consolas,"Liberation Mono",Courier,monospace;color:#23241f}h1 small,h2 small,h3 small,h4 small,h5 small,h6 small{line-height:0;color:#cacaca}h1{font-size:1.5789473684rem}h2{font-size:1.3157894737rem}h3{font-size:1.25rem}h4{font-size:1.1842105263rem}h5{font-size:1.1184210526rem}h6{font-size:1.0526315789rem}@media print,screen and (min-width:40em){h1{font-size:1.7105263158rem}h2{font-size:1.5789473684rem}h3{font-size:1.3157894737rem}h4{font-size:1.1842105263rem}h5{font-size:1.1184210526rem}h6{font-size:1.0526315789rem}}a{background-color:transparent;-webkit-text-decoration-skip:objects;color:#1779ba;cursor:pointer}a:focus,a:hover{color:#1468a0}a img{border:0}hr{box-sizing:content-box;max-width:auto;height:0;margin:1.3157894737rem auto;border-top:0;border-right:0;border-bottom:1px solid #cacaca;border-left:0}dl,ol,ul{list-style-position:outside}li{font-size:inherit}ul{list-style-type:disc}ol ol,ol ul,ul ol,ul ul{margin-left:1.25rem;margin-bottom:0}dl dt{margin-bottom:.3rem;font-weight:700}.subheader,code,label,select{font-weight:400}blockquote{margin:0 0 1rem;padding:.5921052632rem 1.3157894737rem 0 1.25rem;border-left:1px solid #cacaca}blockquote,blockquote p{line-height:1.6;color:#8a8a8a}cite{display:block;font-size:.8552631579rem;color:#8a8a8a}cite:before{content:"— "}abbr,abbr[title]{border-bottom:1px dotted #23241f;cursor:help}code{padding:.1315789474rem .3289473684rem .0657894737rem;border:1px solid #cacaca}kbd{padding:.1315789474rem .2631578947rem 0}.button,select{font-family:inherit}.subheader{margin-top:.2rem;margin-bottom:.5rem;line-height:1.4;color:#8a8a8a}.lead{font-size:118.75%;line-height:1.6}.button,.stat{line-height:1}.stat{font-size:2.5rem}p+.stat{margin-top:-1rem}ol.no-bullet,ul.no-bullet{margin-left:0;list-style:none}.text-left{text-align:left}.text-right{text-align:right}.text-center{text-align:center}.text-justify{text-align:justify}@media print,screen and (min-width:40em){.medium-text-left{text-align:left}.medium-text-right{text-align:right}.medium-text-center{text-align:center}.medium-text-justify{text-align:justify}}@media print,screen and (min-width:64em){.large-text-left{text-align:left}.large-text-right{text-align:right}.large-text-center{text-align:center}.large-text-justify{text-align:justify}}.show-for-print{display:none!important}@media print{blockquote,img,pre,tr{page-break-inside:avoid}*{background:0 0!important;box-shadow:none!important;color:#000!important;text-shadow:none!important}.show-for-print{display:block!important}.hide-for-print{display:none!important}table.show-for-print{display:table!important}thead.show-for-print{display:table-header-group!important}tbody.show-for-print{display:table-row-group!important}tr.show-for-print{display:table-row!important}td.show-for-print,th.show-for-print{display:table-cell!important}a,a:visited{text-decoration:underline}a[href]:after{content:" (" attr(href) ")"}.ir a:after,a[href^='javascript:']:after,a[href^='#']:after{content:''}abbr[title]:after{content:" (" attr(title) ")"}blockquote,pre{border:1px solid #8a8a8a}thead{display:table-header-group}img{max-width:100%!important}@page{margin:.5cm}h2,h3,p{orphans:3;widows:3}h2,h3{page-break-after:avoid}.print-break-inside{page-break-inside:auto}}.button{display:inline-block;vertical-align:middle;margin:0 0 1rem;padding:.85em 1em;-webkit-appearance:none;border:1px solid transparent;border-radius:0;transition:background-color .25s ease-out,color .25s ease-out;font-size:.9rem;text-align:center;cursor:pointer;background-color:#1779ba;color:#fefefe}.button.disabled,.button.disabled.alert,.button.disabled.primary,.button.disabled.secondary,.button.disabled.success,.button.disabled.warning,.button[disabled],.button[disabled].alert,.button[disabled].primary,.button[disabled].secondary,.button[disabled].success,.button[disabled].warning{opacity:.25;cursor:not-allowed}.button:focus,.button:hover{background-color:#14679e;color:#fefefe}.button.tiny{font-size:.6rem}.button.small{font-size:.75rem}.button.large{font-size:1.25rem}.button.expanded{display:block;width:100%;margin-right:0;margin-left:0}.button.primary{background-color:#1779ba;color:#fefefe}.button.primary:focus,.button.primary:hover{background-color:#126195;color:#fefefe}.button.secondary{background-color:#767676;color:#fefefe}.button.secondary:focus,.button.secondary:hover{background-color:#5e5e5e;color:#fefefe}.button.success{background-color:#3adb76;color:#23241f}.button.success:focus,.button.success:hover{background-color:#22bb5b;color:#23241f}.button.warning{background-color:#ffae00;color:#23241f}.button.warning:focus,.button.warning:hover{background-color:#cc8b00;color:#23241f}.button.alert{background-color:#cc4b37;color:#fefefe}.button.alert:focus,.button.alert:hover{background-color:#a53b2a;color:#fefefe}.button.disabled,.button.disabled.primary,.button.disabled.primary:focus,.button.disabled.primary:hover,.button.disabled:focus,.button.disabled:hover,.button[disabled],.button[disabled].primary,.button[disabled].primary:focus,.button[disabled].primary:hover,.button[disabled]:focus,.button[disabled]:hover{background-color:#1779ba;color:#fefefe}.button.disabled.secondary,.button.disabled.secondary:focus,.button.disabled.secondary:hover,.button[disabled].secondary,.button[disabled].secondary:focus,.button[disabled].secondary:hover{background-color:#767676;color:#fefefe}.button.disabled.success,.button.disabled.success:focus,.button.disabled.success:hover,.button[disabled].success,.button[disabled].success:focus,.button[disabled].success:hover{background-color:#3adb76;color:#23241f}.button.disabled.warning,.button.disabled.warning:focus,.button.disabled.warning:hover,.button[disabled].warning,.button[disabled].warning:focus,.button[disabled].warning:hover{background-color:#ffae00;color:#23241f}.button.disabled.alert,.button.disabled.alert:focus,.button.disabled.alert:hover,.button[disabled].alert,.button[disabled].alert:focus,.button[disabled].alert:hover{background-color:#cc4b37;color:#fefefe}.button.clear,.button.clear.disabled,.button.clear.disabled:focus,.button.clear.disabled:hover,.button.clear:focus,.button.clear:hover,.button.clear[disabled],.button.clear[disabled]:focus,.button.clear[disabled]:hover,.button.hollow,.button.hollow.disabled,.button.hollow.disabled:focus,.button.hollow.disabled:hover,.button.hollow:focus,.button.hollow:hover,.button.hollow[disabled],.button.hollow[disabled]:focus,.button.hollow[disabled]:hover{background-color:transparent}.button.hollow{border:1px solid #1779ba;color:#1779ba}.button.hollow:focus,.button.hollow:hover{border-color:#0c3d5d;color:#0c3d5d}.button.hollow.primary,.button.hollow:focus.disabled,.button.hollow:focus[disabled],.button.hollow:hover.disabled,.button.hollow:hover[disabled]{border:1px solid #1779ba;color:#1779ba}.button.hollow.primary:focus,.button.hollow.primary:hover{border-color:#0c3d5d;color:#0c3d5d}.button.hollow.primary:focus.disabled,.button.hollow.primary:focus[disabled],.button.hollow.primary:hover.disabled,.button.hollow.primary:hover[disabled]{border:1px solid #1779ba;color:#1779ba}.button.hollow.secondary{border:1px solid #767676;color:#767676}.button.hollow.secondary:focus,.button.hollow.secondary:hover{border-color:#3b3b3b;color:#3b3b3b}.button.hollow.secondary:focus.disabled,.button.hollow.secondary:focus[disabled],.button.hollow.secondary:hover.disabled,.button.hollow.secondary:hover[disabled]{border:1px solid #767676;color:#767676}.button.hollow.success{border:1px solid #3adb76;color:#3adb76}.button.hollow.success:focus,.button.hollow.success:hover{border-color:#157539;color:#157539}.button.hollow.success:focus.disabled,.button.hollow.success:focus[disabled],.button.hollow.success:hover.disabled,.button.hollow.success:hover[disabled]{border:1px solid #3adb76;color:#3adb76}.button.hollow.warning{border:1px solid #ffae00;color:#ffae00}.button.hollow.warning:focus,.button.hollow.warning:hover{border-color:#805700;color:#805700}.button.hollow.warning:focus.disabled,.button.hollow.warning:focus[disabled],.button.hollow.warning:hover.disabled,.button.hollow.warning:hover[disabled]{border:1px solid #ffae00;color:#ffae00}.button.hollow.alert{border:1px solid #cc4b37;color:#cc4b37}.button.hollow.alert:focus,.button.hollow.alert:hover{border-color:#67251a;color:#67251a}.button.hollow.alert:focus.disabled,.button.hollow.alert:focus[disabled],.button.hollow.alert:hover.disabled,.button.hollow.alert:hover[disabled]{border:1px solid #cc4b37;color:#cc4b37}.button.clear{border:1px solid #1779ba;color:#1779ba}input:disabled,input[readonly],select:disabled,textarea:disabled,textarea[readonly]{background-color:#e6e6e6;cursor:not-allowed}.button.clear:focus,.button.clear:hover{color:#0c3d5d}.button.clear:focus.disabled,.button.clear:focus[disabled],.button.clear:hover.disabled,.button.clear:hover[disabled]{border:1px solid #1779ba;color:#1779ba}.button.clear,.button.clear.disabled,.button.clear:focus,.button.clear:focus.disabled,.button.clear:focus[disabled],.button.clear:hover,.button.clear:hover.disabled,.button.clear:hover[disabled],.button.clear[disabled]{border-color:transparent}.button.clear.primary{border:1px solid #1779ba;color:#1779ba}.button.clear.primary:focus,.button.clear.primary:hover{color:#0c3d5d}.button.clear.primary:focus.disabled,.button.clear.primary:focus[disabled],.button.clear.primary:hover.disabled,.button.clear.primary:hover[disabled]{border:1px solid #1779ba;color:#1779ba}.button.clear.primary,.button.clear.primary.disabled,.button.clear.primary:focus,.button.clear.primary:focus.disabled,.button.clear.primary:focus[disabled],.button.clear.primary:hover,.button.clear.primary:hover.disabled,.button.clear.primary:hover[disabled],.button.clear.primary[disabled]{border-color:transparent}.button.clear.secondary{border:1px solid #767676;color:#767676}.button.clear.secondary:focus,.button.clear.secondary:hover{color:#3b3b3b}.button.clear.secondary:focus.disabled,.button.clear.secondary:focus[disabled],.button.clear.secondary:hover.disabled,.button.clear.secondary:hover[disabled]{border:1px solid #767676;color:#767676}.button.clear.secondary,.button.clear.secondary.disabled,.button.clear.secondary:focus,.button.clear.secondary:focus.disabled,.button.clear.secondary:focus[disabled],.button.clear.secondary:hover,.button.clear.secondary:hover.disabled,.button.clear.secondary:hover[disabled],.button.clear.secondary[disabled]{border-color:transparent}.button.clear.success{border:1px solid #3adb76;color:#3adb76}.button.clear.success:focus,.button.clear.success:hover{color:#157539}.button.clear.success:focus.disabled,.button.clear.success:focus[disabled],.button.clear.success:hover.disabled,.button.clear.success:hover[disabled]{border:1px solid #3adb76;color:#3adb76}.button.clear.success,.button.clear.success.disabled,.button.clear.success:focus,.button.clear.success:focus.disabled,.button.clear.success:focus[disabled],.button.clear.success:hover,.button.clear.success:hover.disabled,.button.clear.success:hover[disabled],.button.clear.success[disabled]{border-color:transparent}.button.clear.warning{border:1px solid #ffae00;color:#ffae00}.button.clear.warning:focus,.button.clear.warning:hover{color:#805700}.button.clear.warning:focus.disabled,.button.clear.warning:focus[disabled],.button.clear.warning:hover.disabled,.button.clear.warning:hover[disabled]{border:1px solid #ffae00;color:#ffae00}.button.clear.warning,.button.clear.warning.disabled,.button.clear.warning:focus,.button.clear.warning:focus.disabled,.button.clear.warning:focus[disabled],.button.clear.warning:hover,.button.clear.warning:hover.disabled,.button.clear.warning:hover[disabled],.button.clear.warning[disabled]{border-color:transparent}.button.clear.alert{border:1px solid #cc4b37;color:#cc4b37}.button.clear.alert:focus,.button.clear.alert:hover{color:#67251a}.button.clear.alert:focus.disabled,.button.clear.alert:focus[disabled],.button.clear.alert:hover.disabled,.button.clear.alert:hover[disabled]{border:1px solid #cc4b37;color:#cc4b37}.button.clear.alert,.button.clear.alert.disabled,.button.clear.alert:focus,.button.clear.alert:focus.disabled,.button.clear.alert:focus[disabled],.button.clear.alert:hover,.button.clear.alert:hover.disabled,.button.clear.alert:hover[disabled],.button.clear.alert[disabled]{border-color:transparent}.button.dropdown::after{width:0;height:0;border:.4em inset;content:'';border-bottom-width:0;border-top-style:solid;border-color:#fefefe transparent transparent;position:relative;top:.4em;display:inline-block;float:right;margin-left:1em}.button.dropdown.hollow.primary::after,.button.dropdown.hollow::after{border-top-color:#1779ba}.button.dropdown.hollow.secondary::after{border-top-color:#767676}.button.dropdown.hollow.success::after{border-top-color:#3adb76}.button.dropdown.hollow.warning::after{border-top-color:#ffae00}.button.dropdown.hollow.alert::after{border-top-color:#cc4b37}.button.arrow-only::after{top:-.1em;float:none;margin-left:0}[type=text],[type=password],[type=date],[type=datetime],[type=datetime-local],[type=month],[type=week],[type=email],[type=number],[type=search],[type=tel],[type=time],[type=url],[type=color],textarea{display:block;box-sizing:border-box;width:100%;height:2.5657894737rem;margin:0 0 1.0526315789rem;padding:.5263157895rem;border:1px solid #cacaca;border-radius:0;background-color:#fefefe;box-shadow:inset 0 1px 2px rgba(35,36,31,.1);font-family:inherit;font-size:1.0526315789rem;font-weight:400;line-height:1.5;color:#23241f;transition:box-shadow .5s,border-color .25s ease-in-out;appearance:none}[type=text]:focus,[type=password]:focus,[type=date]:focus,[type=datetime]:focus,[type=datetime-local]:focus,[type=month]:focus,[type=week]:focus,[type=email]:focus,[type=number]:focus,[type=search]:focus,[type=tel]:focus,[type=time]:focus,[type=url]:focus,[type=color]:focus,textarea:focus{outline:0;border:1px solid #8a8a8a;background-color:#fefefe;box-shadow:0 0 5px #cacaca;transition:box-shadow .5s,border-color .25s ease-in-out}textarea{min-height:50px;max-width:100%}textarea[rows]{height:auto}input::placeholder,textarea::placeholder{color:#cacaca}[type=submit],[type=button]{appearance:none;border-radius:0}input[type=search]{box-sizing:border-box}[type=file],[type=checkbox],[type=radio]{margin:0 0 1.0526315789rem}[type=checkbox]+label,[type=radio]+label{display:inline-block;vertical-align:baseline;margin-left:.5263157895rem;margin-right:1.0526315789rem;margin-bottom:0}[type=checkbox]+label[for],[type=radio]+label[for]{cursor:pointer}label>[type=checkbox],label>[type=radio]{margin-right:.5263157895rem}[type=file]{width:100%}label{display:block;margin:0;font-size:.9210526316rem;line-height:1.8;color:#23241f}label.middle{margin:0 0 1.0526315789rem;padding:.5921052632rem 0}.help-text{margin-top:-.5263157895rem;font-size:.8552631579rem;font-style:italic;color:#23241f}.input-group{display:flex;width:100%;margin-bottom:1.0526315789rem;align-items:stretch}.input-group>:first-child,.input-group>:last-child>*{border-radius:0}.input-group-button,.input-group-button a,.input-group-button button,.input-group-button input,.input-group-button label,.input-group-field,.input-group-label{margin:0;white-space:nowrap}.input-group-label{padding:0 1rem;border:1px solid #cacaca;background:#e6e6e6;color:#23241f;text-align:center;white-space:nowrap;display:flex;flex:0 0 auto;align-items:center}select,select:focus{background-color:#fefefe;transition:box-shadow .5s,border-color .25s ease-in-out}.input-group-label:first-child{border-right:0}.input-group-label:last-child{border-left:0}.input-group-field{border-radius:0;flex:1 1 0px;height:auto;min-width:0}.fieldset,select{border:1px solid #cacaca}.input-group-button{padding-top:0;padding-bottom:0;text-align:center;flex:0 0 auto}.input-group-button a,.input-group-button button,.input-group-button input,.input-group-button label{height:2.6315789474rem;padding-top:0;padding-bottom:0;font-size:1.0526315789rem}fieldset{margin:0;padding:0;border:0}legend{max-width:100%;margin-bottom:.5263157895rem}.fieldset{margin:1.1842105263rem 0;padding:1.3157894737rem}.fieldset legend{margin:0 0 0 -.1973684211rem;padding:0 .1973684211rem}select{height:2.5657894737rem;margin:0 0 1.0526315789rem;padding:.5263157895rem 1.5789473684rem .5263157895rem .5263157895rem;appearance:none;border-radius:0;font-size:1.0526315789rem;line-height:1.5;color:#23241f;background-image:url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='32' height='24' viewBox='0 0 32 24'><polygon points='0,0 32,0 16,24' style='fill: rgb%28138, 138, 138%29'></polygon></svg>");background-origin:content-box;background-position:right -1.0526315789rem center;background-repeat:no-repeat;background-size:9px 6px}.form-error,caption{font-weight:700}.form-error,.is-invalid-label{color:#cc4b37}@media screen and (min-width:0\0){select{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAYCAYAAACbU/80AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAIpJREFUeNrEkckNgDAMBBfRkEt0ObRBBdsGXUDgmQfK4XhH2m8czQAAy27R3tsw4Qfe2x8uOO6oYLb6GlOor3GF+swURAOmUJ+RwtEJs9WvTGEYxBXqI1MQAZhCfUQKRzDMVj+TwrAIV6jvSUEkYAr1LSkcyTBb/V+KYfX7xAeusq3sLDtGH3kEGACPWIflNZfhRQAAAABJRU5ErkJggg==)}}select:focus{border:1px solid #8a8a8a;box-shadow:0 0 5px #cacaca}select::-ms-expand{display:none}select[multiple]{height:auto;background-image:none}.is-invalid-input:not(:focus){border-color:#cc4b37;background-color:#f9ecea}.label,.label.primary{background:#1779ba;color:#fefefe}.is-invalid-input:not(:focus)::placeholder{color:#cc4b37}.form-error{display:none;margin-top:-.5263157895rem;margin-bottom:1.0526315789rem;font-size:.7894736842rem}.form-error.is-visible{display:block}.hide{display:none!important}.invisible{visibility:hidden}@media screen and (max-width:0em),screen and (min-width:40em){.show-for-small-only{display:none!important}}@media print,screen and (min-width:40em){.hide-for-medium{display:none!important}}@media screen and (max-width:39.9375em){.hide-for-small-only,.show-for-medium{display:none!important}}@media screen and (min-width:40em) and (max-width:63.9375em){.hide-for-medium-only{display:none!important}}@media screen and (max-width:39.9375em),screen and (min-width:64em){.show-for-medium-only{display:none!important}}@media print,screen and (min-width:64em){.hide-for-large{display:none!important}}@media screen and (max-width:63.9375em){.show-for-large{display:none!important}}@media screen and (min-width:64em) and (max-width:74.9375em){.hide-for-large-only{display:none!important}}@media screen and (max-width:63.9375em),screen and (min-width:75em){.show-for-large-only{display:none!important}}.show-for-sr,.show-on-focus{position:absolute!important;width:1px;height:1px;padding:0;overflow:hidden;clip:rect(0,0,0,0);white-space:nowrap;clip-path:inset(50%);border:0}.label,table{border-radius:0}.show-on-focus:active,.show-on-focus:focus{position:static!important;width:auto;height:auto;overflow:visible;clip:auto;white-space:normal;clip-path:none}.table-scroll,table.scroll{overflow-x:auto}.hide-for-portrait,.show-for-landscape{display:block!important}@media screen and (orientation:landscape){.hide-for-portrait,.show-for-landscape{display:block!important}.hide-for-landscape,.show-for-portrait{display:none!important}}.hide-for-landscape,.show-for-portrait{display:none!important}@media screen and (orientation:portrait){.hide-for-portrait,.show-for-landscape{display:none!important}.hide-for-landscape,.show-for-portrait{display:block!important}}.float-left{float:left!important}.float-right{float:right!important}.float-center{display:block;margin-right:auto;margin-left:auto}.clearfix::after,.clearfix::before{display:table;content:' ';flex-basis:0;order:1}.close-button{position:absolute;color:#8a8a8a;cursor:pointer}.close-button:focus,.close-button:hover{color:#23241f}.close-button.small{right:.66rem;top:.33em;font-size:1.5em;line-height:1}.close-button,.close-button.medium{right:1rem;top:.5rem;font-size:2em;line-height:1}.label{display:inline-block;padding:.33333rem .5rem;font-size:.8rem;line-height:1;white-space:nowrap;cursor:default}caption,tbody td,tbody th,tfoot td,tfoot th,thead td,thead th{padding:.5263157895rem .6578947368rem .6578947368rem}.label.secondary{background:#767676;color:#fefefe}.label.success{background:#3adb76;color:#23241f}.label.warning{background:#ffae00;color:#23241f}.label.alert{background:#cc4b37;color:#fefefe}tfoot,thead{color:#23241f}table{border-collapse:collapse;width:100%;margin-bottom:1rem}tbody,tfoot,thead{border:1px solid #f1f1f1;background-color:#fefefe}thead{background:#f8f8f8}tfoot{background:#f1f1f1}tfoot tr,thead tr{background:0 0}tfoot td,tfoot th,thead td,thead th{font-weight:700;text-align:left}tbody tr:nth-child(even){border-bottom:0;background-color:#f1f1f1}table.unstriped tbody,table.unstriped tbody tr{background-color:#fefefe}table.unstriped tbody tr{border-bottom:0;border-bottom:1px solid #f1f1f1}@media screen and (max-width:63.9375em){table.stack tfoot,table.stack thead{display:none}table.stack td,table.stack th,table.stack tr{display:block}table.stack td{border-top:0}}table.scroll{display:block;width:100%}table.hover thead tr:hover{background-color:#f3f3f3}table.hover tfoot tr:hover{background-color:#ececec}table.hover tbody tr:hover{background-color:#f9f9f9}table.hover:not(.unstriped) tr:nth-of-type(even):hover{background-color:#ececec}.table-scroll table{width:auto}</style>    <style>#spectacle .swagger-operation-description:before,#spectacle .swagger-operation-path:before,#spectacle .swagger-request-body:before,#spectacle .swagger-request-params:before,#spectacle .swagger-responses:before{color:#f68b1f;font-size:.9rem;margin-bottom:.5em;text-transform:uppercase}#spectacle table.table th.swagger-param-data-type,#spectacle table.table th.swagger-param-description,#spectacle table.table th.swagger-param-key,#spectacle table.table th.swagger-param-name,#spectacle table.table th.swagger-param-type,#spectacle table.table th.swagger-request-security-schema,#spectacle table.table th.swagger-response-code,#spectacle table.table th.swagger-response-description,#spectacle table.table th.swagger-response-header-data-type,#spectacle table.table th.swagger-response-header-description,#spectacle table.table th.swagger-response-header-name,#spectacle table.table th.swagger-response-schema{width:auto}#spectacle .hljs-emphasis,#spectacle .json-property-format{font-style:italic}#spectacle .swagger-operation-path:before{content:"Path";display:block}#spectacle .swagger-operation-description:before{content:"Description";display:block}#spectacle .swagger-request-params:before{content:"Request parameters";display:block}#spectacle .swagger-request-body:before{content:"Request body";display:block}#spectacle .swagger-request-body .json-schema-properties:before{display:none}#spectacle .swagger-responses:before{content:"Responses";display:block}#spectacle .swagger-global:before{display:inline-block;line-height:1;white-space:nowrap;cursor:default;background:#cc4b37;color:#fefefe;font-size:.75rem;border-radius:4px;padding:3px 6px;content:"global"}#spectacle table.table th.swagger-param-key:before{content:"Key"}#spectacle table.table th.swagger-param-name:before{content:"Name"}#spectacle table.table th.swagger-param-description:before{content:"Description"}#spectacle table.table th.swagger-param-data-type:before{content:"Data type"}#spectacle table.table th.swagger-param-type:before{content:"Type"}#spectacle table.table th.swagger-request-security-schema:before{content:"Schema"}#spectacle table.table th.swagger-request-security-scopes{width:auto}#spectacle table.table th.swagger-request-security-scopes:before{content:"Scopes"}#spectacle table.table th.swagger-response-header-name:before{content:"Header"}#spectacle table.table th.swagger-response-header-description:before{content:"Description"}#spectacle table.table th.swagger-response-header-data-type:before{content:"Data type"}#spectacle table.table th.swagger-response-code:before{content:"Code"}#spectacle table.table th.swagger-response-description:before{content:"Description"}#spectacle table.table th.swagger-response-schema:before{content:"Schema"}#spectacle .swagger-response-name-value{font-weight:700}#spectacle .swagger-response-description-text{padding-bottom:.5em}#spectacle .swagger-request-security:before{content:"Security";display:block;margin-bottom:.5em;color:#f68b1f;text-transform:uppercase;font-size:.9rem}#spectacle .swagger-security-definition-basic:before{color:#cacaca;content:"(HTTP Basic Authentication)"}#spectacle .swagger-security-definition-oauth2:before{color:#cacaca;content:"(OAuth2 Authentication)"}#spectacle .swagger-security-definition-apiKey:before{color:#cacaca;content:"(API Key Authentication)"}#spectacle .json-schema-description:before,#spectacle .json-schema-properties:before{display:block;margin-bottom:.5em;color:#f68b1f;text-transform:uppercase;font-size:.9rem}#spectacle .json-schema-description:before{content:"Description"}#spectacle .json-schema-properties:before{content:"Properties"}#spectacle .json-schema-properties dl{margin:0}#spectacle .json-schema-properties dt{margin-bottom:.25rem}#spectacle .json-schema-properties dt.has-description{margin-bottom:0}#spectacle .json-schema-properties dd{color:#8a8a8a}#spectacle .json-schema-properties dd:not(:last-child){padding-bottom:.5rem}#spectacle .json-schema-description+.json-schema-properties{margin-top:1.5rem}#spectacle .json-schema-ref-array:before{color:#8a8a8a;content:"Array<"}#spectacle .json-schema-ref-array:after{color:#8a8a8a;content:">"}#spectacle .json-schema-additionalProperties:before,#spectacle .json-schema-allOf-inherited:before,#spectacle .json-schema-array-items:before,#spectacle .json-schema-example:before{display:block;margin-bottom:.5em;color:#f68b1f;font-size:.9rem;text-transform:uppercase}#spectacle .json-schema-example:before{content:"Example"}#spectacle .json-schema-array-items:before{content:"Items"}#spectacle .json-schema-allOf-inherited:before{content:"Inherited"}#spectacle .json-schema-anyOf>dl{padding-left:1em}#spectacle .json-schema-anyOf>dl dt:not(:first-child):before{content:"or "}#spectacle .json-schema-anyOf>dl dt:first-child:before{content:"either "}#spectacle .json-schema-additionalProperties:before{content:"Additional properties"}#spectacle .json-inner-schema .json-schema-array-items,#spectacle .json-inner-schema .json-schema-description,#spectacle .json-inner-schema .json-schema-example,#spectacle .json-inner-schema .json-schema-properties{padding-left:1em;margin-top:.5em;padding-bottom:.5em}#spectacle .json-property-discriminator:before,#spectacle .json-property-read-only:before,#spectacle .json-property-required:before{display:inline-block;background:#cc4b37;font-size:.75rem;padding:3px 6px;line-height:1;cursor:default;color:#fefefe;border-radius:4px;white-space:nowrap}#spectacle .json-property-discriminator:before{content:"discriminator"}#spectacle .json-property-required:before{content:"required"}#spectacle .json-property-read-only:before{content:"read only"}#spectacle .json-property-enum:before{content:'enum: ['}#spectacle .json-property-enum:after{content:']'}#spectacle .json-property-default-value:before{content:'default: '}#spectacle .json-property-range:empty{display:none!important}#spectacle .json-property-range:before{content:'range: '}#spectacle .json-property-enum-item{font-weight:lighter;font-size:small}#spectacle .json-schema-reference{font-size:90%}#spectacle .no-padding{padding:0!important}#spectacle .no-margin{margin:0!important}#spectacle button:focus{outline:0}#spectacle .default-label{display:inline-block;line-height:1;white-space:nowrap;cursor:default;background:#767676;color:#fefefe;font-size:.75rem;border-radius:4px;padding:3px 6px}#spectacle #logo{text-align:center;padding-right:.5rem;padding-top:1rem;padding-bottom:.25rem}#spectacle #logo img{max-height:75px}#spectacle .row,#spectacle article .doc-row,#spectacle article .prop-row{max-width:auto;margin-right:auto;margin-left:auto}#spectacle .row.expanded,#spectacle .row:not(.expanded) .row,#spectacle .row:not(.expanded) article .doc-row,#spectacle .row:not(.expanded) article .prop-row,#spectacle article .doc-row:not(.expanded) .doc-row,#spectacle article .doc-row:not(.expanded) .prop-row,#spectacle article .doc-row:not(.expanded) .row,#spectacle article .expanded.doc-row,#spectacle article .expanded.prop-row,#spectacle article .prop-row:not(.expanded) .doc-row,#spectacle article .prop-row:not(.expanded) .prop-row,#spectacle article .prop-row:not(.expanded) .row,#spectacle article .row:not(.expanded) .doc-row,#spectacle article .row:not(.expanded) .prop-row{max-width:none}#spectacle .row::after,#spectacle .row::before,#spectacle article .doc-row::after,#spectacle article .doc-row::before,#spectacle article .prop-row::after,#spectacle article .prop-row::before{display:table;content:' ';flex-basis:0;order:1}#spectacle .row::after,#spectacle article .doc-row::after,#spectacle article .prop-row::after{clear:both}#spectacle .row.collapse>.column,#spectacle .row.collapse>.columns,#spectacle article .doc-row>.column,#spectacle article .doc-row>.columns,#spectacle article .doc-row>.doc-copy,#spectacle article .doc-row>.doc-examples,#spectacle article .prop-row .doc-row>.prop-name,#spectacle article .prop-row .doc-row>.prop-value,#spectacle article .prop-row .row.collapse>.prop-name,#spectacle article .prop-row .row.collapse>.prop-value,#spectacle article .prop-row>.column,#spectacle article .prop-row>.columns,#spectacle article .prop-row>.doc-copy,#spectacle article .prop-row>.doc-examples,#spectacle article .prop-row>.prop-name,#spectacle article .prop-row>.prop-value,#spectacle article .row.collapse>.doc-copy,#spectacle article .row.collapse>.doc-examples{padding-right:0;padding-left:0}#spectacle .row .row,#spectacle .row article .doc-row,#spectacle .row article .prop-row,#spectacle article .doc-row .doc-row,#spectacle article .doc-row .prop-row,#spectacle article .doc-row .row,#spectacle article .prop-row .doc-row,#spectacle article .prop-row .prop-row,#spectacle article .prop-row .row,#spectacle article .row .doc-row,#spectacle article .row .prop-row{margin-right:-.6578947368rem;margin-left:-.6578947368rem}@media print,screen and (min-width:40em){#spectacle .row .row,#spectacle .row article .doc-row,#spectacle .row article .prop-row,#spectacle article .doc-row .doc-row,#spectacle article .doc-row .prop-row,#spectacle article .doc-row .row,#spectacle article .prop-row .doc-row,#spectacle article .prop-row .prop-row,#spectacle article .prop-row .row,#spectacle article .row .doc-row,#spectacle article .row .prop-row{margin-right:-.9868421053rem;margin-left:-.9868421053rem}}@media print,screen and (min-width:64em){#spectacle .row .row,#spectacle .row article .doc-row,#spectacle .row article .prop-row,#spectacle article .doc-row .doc-row,#spectacle article .doc-row .prop-row,#spectacle article .doc-row .row,#spectacle article .prop-row .doc-row,#spectacle article .prop-row .prop-row,#spectacle article .prop-row .row,#spectacle article .row .doc-row,#spectacle article .row .prop-row{margin-right:-.9868421053rem;margin-left:-.9868421053rem}}#spectacle .row .row.collapse,#spectacle .row article .doc-row,#spectacle .row article .prop-row,#spectacle article .doc-row .doc-row,#spectacle article .doc-row .prop-row,#spectacle article .doc-row .row.collapse,#spectacle article .prop-row .doc-row,#spectacle article .prop-row .prop-row,#spectacle article .prop-row .row.collapse,#spectacle article .row .doc-row,#spectacle article .row .prop-row{margin-right:0;margin-left:0}#spectacle .row.expanded .row,#spectacle .row.expanded article .doc-row,#spectacle .row.expanded article .prop-row,#spectacle article .expanded.doc-row .doc-row,#spectacle article .expanded.doc-row .prop-row,#spectacle article .expanded.doc-row .row,#spectacle article .expanded.prop-row .doc-row,#spectacle article .expanded.prop-row .prop-row,#spectacle article .expanded.prop-row .row,#spectacle article .row.expanded .doc-row,#spectacle article .row.expanded .prop-row{margin-right:auto;margin-left:auto}#spectacle .row.gutter-small>.column,#spectacle .row.gutter-small>.columns,#spectacle article .gutter-small.doc-row>.column,#spectacle article .gutter-small.doc-row>.columns,#spectacle article .gutter-small.doc-row>.doc-copy,#spectacle article .gutter-small.doc-row>.doc-examples,#spectacle article .gutter-small.prop-row>.column,#spectacle article .gutter-small.prop-row>.columns,#spectacle article .gutter-small.prop-row>.doc-copy,#spectacle article .gutter-small.prop-row>.doc-examples,#spectacle article .gutter-small.prop-row>.prop-name,#spectacle article .gutter-small.prop-row>.prop-value,#spectacle article .prop-row .gutter-small.doc-row>.prop-name,#spectacle article .prop-row .gutter-small.doc-row>.prop-value,#spectacle article .prop-row .row.gutter-small>.prop-name,#spectacle article .prop-row .row.gutter-small>.prop-value,#spectacle article .row.gutter-small>.doc-copy,#spectacle article .row.gutter-small>.doc-examples{padding-right:.6578947368rem;padding-left:.6578947368rem}#spectacle .row.gutter-medium>.column,#spectacle .row.gutter-medium>.columns,#spectacle article .gutter-medium.doc-row>.column,#spectacle article .gutter-medium.doc-row>.columns,#spectacle article .gutter-medium.doc-row>.doc-copy,#spectacle article .gutter-medium.doc-row>.doc-examples,#spectacle article .gutter-medium.prop-row>.column,#spectacle article .gutter-medium.prop-row>.columns,#spectacle article .gutter-medium.prop-row>.doc-copy,#spectacle article .gutter-medium.prop-row>.doc-examples,#spectacle article .gutter-medium.prop-row>.prop-name,#spectacle article .gutter-medium.prop-row>.prop-value,#spectacle article .prop-row .gutter-medium.doc-row>.prop-name,#spectacle article .prop-row .gutter-medium.doc-row>.prop-value,#spectacle article .prop-row .row.gutter-medium>.prop-name,#spectacle article .prop-row .row.gutter-medium>.prop-value,#spectacle article .row.gutter-medium>.doc-copy,#spectacle article .row.gutter-medium>.doc-examples{padding-right:.9868421053rem;padding-left:.9868421053rem}#spectacle .column,#spectacle .columns,#spectacle article .doc-copy,#spectacle article .doc-examples,#spectacle article .prop-row .prop-name,#spectacle article .prop-row .prop-value{width:100%;float:left;padding-right:.6578947368rem;padding-left:.6578947368rem}@media print,screen and (min-width:40em){#spectacle .column,#spectacle .columns,#spectacle article .doc-copy,#spectacle article .doc-examples,#spectacle article .prop-row .prop-name,#spectacle article .prop-row .prop-value{padding-right:.9868421053rem;padding-left:.9868421053rem}}#spectacle .column:last-child:not(:first-child),#spectacle .columns:last-child:not(:first-child),#spectacle article .doc-copy:last-child:not(:first-child),#spectacle article .doc-examples:last-child:not(:first-child),#spectacle article .prop-row .prop-name:last-child:not(:first-child),#spectacle article .prop-row .prop-value:last-child:not(:first-child){float:right}#spectacle .column.end:last-child:last-child,#spectacle .end.columns:last-child:last-child,#spectacle article .end.doc-copy:last-child:last-child,#spectacle article .end.doc-examples:last-child:last-child,#spectacle article .prop-row .end.prop-name:last-child:last-child,#spectacle article .prop-row .end.prop-value:last-child:last-child{float:left}#spectacle .column.row.row,#spectacle .row.row.columns,#spectacle article .column.doc-row,#spectacle article .column.prop-row,#spectacle article .columns.doc-row,#spectacle article .columns.prop-row,#spectacle article .doc-row.doc-copy,#spectacle article .doc-row.doc-examples,#spectacle article .prop-row .prop-name.doc-row,#spectacle article .prop-row .prop-row.prop-name,#spectacle article .prop-row .prop-row.prop-value,#spectacle article .prop-row .prop-value.doc-row,#spectacle article .prop-row .row.row.prop-name,#spectacle article .prop-row .row.row.prop-value,#spectacle article .prop-row.doc-copy,#spectacle article .prop-row.doc-examples,#spectacle article .row.row.doc-copy,#spectacle article .row.row.doc-examples{float:none}#spectacle .row .column.row.row,#spectacle .row .row.row.columns,#spectacle .row article .column.doc-row,#spectacle .row article .column.prop-row,#spectacle .row article .columns.doc-row,#spectacle .row article .columns.prop-row,#spectacle .row article .doc-row.doc-copy,#spectacle .row article .doc-row.doc-examples,#spectacle .row article .prop-row .prop-name.doc-row,#spectacle .row article .prop-row .prop-row.prop-name,#spectacle .row article .prop-row .prop-row.prop-value,#spectacle .row article .prop-row .prop-value.doc-row,#spectacle .row article .prop-row.doc-copy,#spectacle .row article .prop-row.doc-examples,#spectacle .row article .row.row.doc-copy,#spectacle .row article .row.row.doc-examples,#spectacle article .doc-row .column.doc-row,#spectacle article .doc-row .column.prop-row,#spectacle article .doc-row .column.row.row,#spectacle article .doc-row .columns.doc-row,#spectacle article .doc-row .columns.prop-row,#spectacle article .doc-row .doc-row.doc-copy,#spectacle article .doc-row .doc-row.doc-examples,#spectacle article .doc-row .prop-row.doc-copy,#spectacle article .doc-row .prop-row.doc-examples,#spectacle article .doc-row .row.row.columns,#spectacle article .doc-row .row.row.doc-copy,#spectacle article .doc-row .row.row.doc-examples,#spectacle article .prop-row .column.doc-row,#spectacle article .prop-row .column.prop-row,#spectacle article .prop-row .column.row.row,#spectacle article .prop-row .columns.doc-row,#spectacle article .prop-row .columns.prop-row,#spectacle article .prop-row .doc-row.doc-copy,#spectacle article .prop-row .doc-row.doc-examples,#spectacle article .prop-row .prop-name.doc-row,#spectacle article .prop-row .prop-row.doc-copy,#spectacle article .prop-row .prop-row.doc-examples,#spectacle article .prop-row .prop-row.prop-name,#spectacle article .prop-row .prop-row.prop-value,#spectacle article .prop-row .prop-value.doc-row,#spectacle article .prop-row .row .prop-name.doc-row,#spectacle article .prop-row .row .prop-row.prop-name,#spectacle article .prop-row .row .prop-row.prop-value,#spectacle article .prop-row .row .prop-value.doc-row,#spectacle article .prop-row .row.row.columns,#spectacle article .prop-row .row.row.doc-copy,#spectacle article .prop-row .row.row.doc-examples,#spectacle article .prop-row .row.row.prop-name,#spectacle article .prop-row .row.row.prop-value,#spectacle article .row .column.doc-row,#spectacle article .row .column.prop-row,#spectacle article .row .columns.doc-row,#spectacle article .row .columns.prop-row,#spectacle article .row .doc-row.doc-copy,#spectacle article .row .doc-row.doc-examples,#spectacle article .row .prop-row.doc-copy,#spectacle article .row .prop-row.doc-examples,#spectacle article .row .row.row.doc-copy,#spectacle article .row .row.row.doc-examples{margin-right:0;margin-left:0;padding-right:0;padding-left:0}#spectacle .small-1{width:8.3333333333%}#spectacle .small-push-1{position:relative;left:8.3333333333%}#spectacle .small-pull-1{position:relative;left:-8.3333333333%}#spectacle .small-offset-0{margin-left:0}#spectacle .small-2{width:16.6666666667%}#spectacle .small-push-2{position:relative;left:16.6666666667%}#spectacle .small-pull-2{position:relative;left:-16.6666666667%}#spectacle .small-offset-1{margin-left:8.3333333333%}#spectacle .small-3{width:25%}#spectacle .small-push-3{position:relative;left:25%}#spectacle .small-pull-3{position:relative;left:-25%}#spectacle .small-offset-2{margin-left:16.6666666667%}#spectacle .small-4{width:33.3333333333%}#spectacle .small-push-4{position:relative;left:33.3333333333%}#spectacle .small-pull-4{position:relative;left:-33.3333333333%}#spectacle .small-offset-3{margin-left:25%}#spectacle .small-5,#spectacle article .prop-row .prop-name{width:41.6666666667%}#spectacle .small-push-5{position:relative;left:41.6666666667%}#spectacle .small-pull-5{position:relative;left:-41.6666666667%}#spectacle .small-offset-4{margin-left:33.3333333333%}#spectacle .small-6{width:50%}#spectacle .small-push-6{position:relative;left:50%}#spectacle .small-pull-6{position:relative;left:-50%}#spectacle .small-offset-5{margin-left:41.6666666667%}#spectacle .small-7,#spectacle article .prop-row .prop-value{width:58.3333333333%}#spectacle .small-push-7{position:relative;left:58.3333333333%}#spectacle .small-pull-7{position:relative;left:-58.3333333333%}#spectacle .small-offset-6{margin-left:50%}#spectacle .small-8{width:66.6666666667%}#spectacle .small-push-8{position:relative;left:66.6666666667%}#spectacle .small-pull-8{position:relative;left:-66.6666666667%}#spectacle .small-offset-7{margin-left:58.3333333333%}#spectacle .small-9{width:75%}#spectacle .small-push-9{position:relative;left:75%}#spectacle .small-pull-9{position:relative;left:-75%}#spectacle .small-offset-8{margin-left:66.6666666667%}#spectacle .small-10{width:83.3333333333%}#spectacle .small-push-10{position:relative;left:83.3333333333%}#spectacle .small-pull-10{position:relative;left:-83.3333333333%}#spectacle .small-offset-9{margin-left:75%}#spectacle .small-11{width:91.6666666667%}#spectacle .small-push-11{position:relative;left:91.6666666667%}#spectacle .small-pull-11{position:relative;left:-91.6666666667%}#spectacle .small-offset-10{margin-left:83.3333333333%}#spectacle .small-12{width:100%}#spectacle .small-offset-11{margin-left:91.6666666667%}#spectacle .small-up-1>.column,#spectacle .small-up-1>.columns,#spectacle article .prop-row .small-up-1>.prop-name,#spectacle article .prop-row .small-up-1>.prop-value,#spectacle article .small-up-1>.doc-copy,#spectacle article .small-up-1>.doc-examples{float:left;width:100%}#spectacle .small-up-1>.column:nth-of-type(1n),#spectacle .small-up-1>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-1>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-1>.prop-value:nth-of-type(1n),#spectacle article .small-up-1>.doc-copy:nth-of-type(1n),#spectacle article .small-up-1>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-1>.column:nth-of-type(1n+1),#spectacle .small-up-1>.columns:nth-of-type(1n+1),#spectacle article .prop-row .small-up-1>.prop-name:nth-of-type(1n+1),#spectacle article .prop-row .small-up-1>.prop-value:nth-of-type(1n+1),#spectacle article .small-up-1>.doc-copy:nth-of-type(1n+1),#spectacle article .small-up-1>.doc-examples:nth-of-type(1n+1){clear:both}#spectacle .small-up-1>.column:last-child,#spectacle .small-up-1>.columns:last-child,#spectacle article .prop-row .small-up-1>.prop-name:last-child,#spectacle article .prop-row .small-up-1>.prop-value:last-child,#spectacle article .small-up-1>.doc-copy:last-child,#spectacle article .small-up-1>.doc-examples:last-child{float:left}#spectacle .small-up-2>.column,#spectacle .small-up-2>.columns,#spectacle article .prop-row .small-up-2>.prop-name,#spectacle article .prop-row .small-up-2>.prop-value,#spectacle article .small-up-2>.doc-copy,#spectacle article .small-up-2>.doc-examples{float:left;width:50%}#spectacle .small-up-2>.column:nth-of-type(1n),#spectacle .small-up-2>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-2>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-2>.prop-value:nth-of-type(1n),#spectacle article .small-up-2>.doc-copy:nth-of-type(1n),#spectacle article .small-up-2>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-2>.column:nth-of-type(2n+1),#spectacle .small-up-2>.columns:nth-of-type(2n+1),#spectacle article .prop-row .small-up-2>.prop-name:nth-of-type(2n+1),#spectacle article .prop-row .small-up-2>.prop-value:nth-of-type(2n+1),#spectacle article .small-up-2>.doc-copy:nth-of-type(2n+1),#spectacle article .small-up-2>.doc-examples:nth-of-type(2n+1){clear:both}#spectacle .small-up-2>.column:last-child,#spectacle .small-up-2>.columns:last-child,#spectacle article .prop-row .small-up-2>.prop-name:last-child,#spectacle article .prop-row .small-up-2>.prop-value:last-child,#spectacle article .small-up-2>.doc-copy:last-child,#spectacle article .small-up-2>.doc-examples:last-child{float:left}#spectacle .small-up-3>.column,#spectacle .small-up-3>.columns,#spectacle article .prop-row .small-up-3>.prop-name,#spectacle article .prop-row .small-up-3>.prop-value,#spectacle article .small-up-3>.doc-copy,#spectacle article .small-up-3>.doc-examples{float:left;width:33.3333333333%}#spectacle .small-up-3>.column:nth-of-type(1n),#spectacle .small-up-3>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-3>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-3>.prop-value:nth-of-type(1n),#spectacle article .small-up-3>.doc-copy:nth-of-type(1n),#spectacle article .small-up-3>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-3>.column:nth-of-type(3n+1),#spectacle .small-up-3>.columns:nth-of-type(3n+1),#spectacle article .prop-row .small-up-3>.prop-name:nth-of-type(3n+1),#spectacle article .prop-row .small-up-3>.prop-value:nth-of-type(3n+1),#spectacle article .small-up-3>.doc-copy:nth-of-type(3n+1),#spectacle article .small-up-3>.doc-examples:nth-of-type(3n+1){clear:both}#spectacle .small-up-3>.column:last-child,#spectacle .small-up-3>.columns:last-child,#spectacle article .prop-row .small-up-3>.prop-name:last-child,#spectacle article .prop-row .small-up-3>.prop-value:last-child,#spectacle article .small-up-3>.doc-copy:last-child,#spectacle article .small-up-3>.doc-examples:last-child{float:left}#spectacle .small-up-4>.column,#spectacle .small-up-4>.columns,#spectacle article .prop-row .small-up-4>.prop-name,#spectacle article .prop-row .small-up-4>.prop-value,#spectacle article .small-up-4>.doc-copy,#spectacle article .small-up-4>.doc-examples{float:left;width:25%}#spectacle .small-up-4>.column:nth-of-type(1n),#spectacle .small-up-4>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-4>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-4>.prop-value:nth-of-type(1n),#spectacle article .small-up-4>.doc-copy:nth-of-type(1n),#spectacle article .small-up-4>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-4>.column:nth-of-type(4n+1),#spectacle .small-up-4>.columns:nth-of-type(4n+1),#spectacle article .prop-row .small-up-4>.prop-name:nth-of-type(4n+1),#spectacle article .prop-row .small-up-4>.prop-value:nth-of-type(4n+1),#spectacle article .small-up-4>.doc-copy:nth-of-type(4n+1),#spectacle article .small-up-4>.doc-examples:nth-of-type(4n+1){clear:both}#spectacle .small-up-4>.column:last-child,#spectacle .small-up-4>.columns:last-child,#spectacle article .prop-row .small-up-4>.prop-name:last-child,#spectacle article .prop-row .small-up-4>.prop-value:last-child,#spectacle article .small-up-4>.doc-copy:last-child,#spectacle article .small-up-4>.doc-examples:last-child{float:left}#spectacle .small-up-5>.column,#spectacle .small-up-5>.columns,#spectacle article .prop-row .small-up-5>.prop-name,#spectacle article .prop-row .small-up-5>.prop-value,#spectacle article .small-up-5>.doc-copy,#spectacle article .small-up-5>.doc-examples{float:left;width:20%}#spectacle .small-up-5>.column:nth-of-type(1n),#spectacle .small-up-5>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-5>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-5>.prop-value:nth-of-type(1n),#spectacle article .small-up-5>.doc-copy:nth-of-type(1n),#spectacle article .small-up-5>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-5>.column:nth-of-type(5n+1),#spectacle .small-up-5>.columns:nth-of-type(5n+1),#spectacle article .prop-row .small-up-5>.prop-name:nth-of-type(5n+1),#spectacle article .prop-row .small-up-5>.prop-value:nth-of-type(5n+1),#spectacle article .small-up-5>.doc-copy:nth-of-type(5n+1),#spectacle article .small-up-5>.doc-examples:nth-of-type(5n+1){clear:both}#spectacle .small-up-5>.column:last-child,#spectacle .small-up-5>.columns:last-child,#spectacle article .prop-row .small-up-5>.prop-name:last-child,#spectacle article .prop-row .small-up-5>.prop-value:last-child,#spectacle article .small-up-5>.doc-copy:last-child,#spectacle article .small-up-5>.doc-examples:last-child{float:left}#spectacle .small-up-6>.column,#spectacle .small-up-6>.columns,#spectacle article .prop-row .small-up-6>.prop-name,#spectacle article .prop-row .small-up-6>.prop-value,#spectacle article .small-up-6>.doc-copy,#spectacle article .small-up-6>.doc-examples{float:left;width:16.6666666667%}#spectacle .small-up-6>.column:nth-of-type(1n),#spectacle .small-up-6>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-6>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-6>.prop-value:nth-of-type(1n),#spectacle article .small-up-6>.doc-copy:nth-of-type(1n),#spectacle article .small-up-6>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-6>.column:nth-of-type(6n+1),#spectacle .small-up-6>.columns:nth-of-type(6n+1),#spectacle article .prop-row .small-up-6>.prop-name:nth-of-type(6n+1),#spectacle article .prop-row .small-up-6>.prop-value:nth-of-type(6n+1),#spectacle article .small-up-6>.doc-copy:nth-of-type(6n+1),#spectacle article .small-up-6>.doc-examples:nth-of-type(6n+1){clear:both}#spectacle .small-up-6>.column:last-child,#spectacle .small-up-6>.columns:last-child,#spectacle article .prop-row .small-up-6>.prop-name:last-child,#spectacle article .prop-row .small-up-6>.prop-value:last-child,#spectacle article .small-up-6>.doc-copy:last-child,#spectacle article .small-up-6>.doc-examples:last-child{float:left}#spectacle .small-up-7>.column,#spectacle .small-up-7>.columns,#spectacle article .prop-row .small-up-7>.prop-name,#spectacle article .prop-row .small-up-7>.prop-value,#spectacle article .small-up-7>.doc-copy,#spectacle article .small-up-7>.doc-examples{float:left;width:14.2857142857%}#spectacle .small-up-7>.column:nth-of-type(1n),#spectacle .small-up-7>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-7>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-7>.prop-value:nth-of-type(1n),#spectacle article .small-up-7>.doc-copy:nth-of-type(1n),#spectacle article .small-up-7>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-7>.column:nth-of-type(7n+1),#spectacle .small-up-7>.columns:nth-of-type(7n+1),#spectacle article .prop-row .small-up-7>.prop-name:nth-of-type(7n+1),#spectacle article .prop-row .small-up-7>.prop-value:nth-of-type(7n+1),#spectacle article .small-up-7>.doc-copy:nth-of-type(7n+1),#spectacle article .small-up-7>.doc-examples:nth-of-type(7n+1){clear:both}#spectacle .small-up-7>.column:last-child,#spectacle .small-up-7>.columns:last-child,#spectacle article .prop-row .small-up-7>.prop-name:last-child,#spectacle article .prop-row .small-up-7>.prop-value:last-child,#spectacle article .small-up-7>.doc-copy:last-child,#spectacle article .small-up-7>.doc-examples:last-child{float:left}#spectacle .small-up-8>.column,#spectacle .small-up-8>.columns,#spectacle article .prop-row .small-up-8>.prop-name,#spectacle article .prop-row .small-up-8>.prop-value,#spectacle article .small-up-8>.doc-copy,#spectacle article .small-up-8>.doc-examples{float:left;width:12.5%}#spectacle .small-up-8>.column:nth-of-type(1n),#spectacle .small-up-8>.columns:nth-of-type(1n),#spectacle article .prop-row .small-up-8>.prop-name:nth-of-type(1n),#spectacle article .prop-row .small-up-8>.prop-value:nth-of-type(1n),#spectacle article .small-up-8>.doc-copy:nth-of-type(1n),#spectacle article .small-up-8>.doc-examples:nth-of-type(1n){clear:none}#spectacle .small-up-8>.column:nth-of-type(8n+1),#spectacle .small-up-8>.columns:nth-of-type(8n+1),#spectacle article .prop-row .small-up-8>.prop-name:nth-of-type(8n+1),#spectacle article .prop-row .small-up-8>.prop-value:nth-of-type(8n+1),#spectacle article .small-up-8>.doc-copy:nth-of-type(8n+1),#spectacle article .small-up-8>.doc-examples:nth-of-type(8n+1){clear:both}#spectacle .small-up-8>.column:last-child,#spectacle .small-up-8>.columns:last-child,#spectacle article .prop-row .small-up-8>.prop-name:last-child,#spectacle article .prop-row .small-up-8>.prop-value:last-child,#spectacle article .small-up-8>.doc-copy:last-child,#spectacle article .small-up-8>.doc-examples:last-child{float:left}#spectacle .small-collapse>.column,#spectacle .small-collapse>.columns,#spectacle article .prop-row .small-collapse>.prop-name,#spectacle article .prop-row .small-collapse>.prop-value,#spectacle article .small-collapse>.doc-copy,#spectacle article .small-collapse>.doc-examples{padding-right:0;padding-left:0}#spectacle .expanded.row .small-collapse.row,#spectacle .expanded.row article .small-collapse.doc-row,#spectacle .expanded.row article .small-collapse.prop-row,#spectacle .small-collapse .row,#spectacle .small-collapse article .doc-row,#spectacle .small-collapse article .prop-row,#spectacle article .expanded.doc-row .small-collapse.doc-row,#spectacle article .expanded.doc-row .small-collapse.prop-row,#spectacle article .expanded.doc-row .small-collapse.row,#spectacle article .expanded.prop-row .small-collapse.doc-row,#spectacle article .expanded.prop-row .small-collapse.prop-row,#spectacle article .expanded.prop-row .small-collapse.row,#spectacle article .expanded.row .small-collapse.doc-row,#spectacle article .expanded.row .small-collapse.prop-row,#spectacle article .small-collapse .doc-row,#spectacle article .small-collapse .prop-row{margin-right:0;margin-left:0}#spectacle .small-uncollapse>.column,#spectacle .small-uncollapse>.columns,#spectacle article .prop-row .small-uncollapse>.prop-name,#spectacle article .prop-row .small-uncollapse>.prop-value,#spectacle article .small-uncollapse>.doc-copy,#spectacle article .small-uncollapse>.doc-examples{padding-right:.6578947368rem;padding-left:.6578947368rem}#spectacle .small-centered{margin-right:auto;margin-left:auto}#spectacle .small-centered,#spectacle .small-centered:last-child:not(:first-child){float:none;clear:both}#spectacle .small-pull-0,#spectacle .small-push-0,#spectacle .small-uncentered{position:static;float:left;margin-right:0;margin-left:0}@media print,screen and (min-width:40em){#spectacle .medium-1{width:8.3333333333%}#spectacle .medium-push-1{position:relative;left:8.3333333333%}#spectacle .medium-pull-1{position:relative;left:-8.3333333333%}#spectacle .medium-offset-0{margin-left:0}#spectacle .medium-2{width:16.6666666667%}#spectacle .medium-push-2{position:relative;left:16.6666666667%}#spectacle .medium-pull-2{position:relative;left:-16.6666666667%}#spectacle .medium-offset-1{margin-left:8.3333333333%}#spectacle .medium-3{width:25%}#spectacle .medium-push-3{position:relative;left:25%}#spectacle .medium-pull-3{position:relative;left:-25%}#spectacle .medium-offset-2{margin-left:16.6666666667%}#spectacle .medium-4{width:33.3333333333%}#spectacle .medium-push-4{position:relative;left:33.3333333333%}#spectacle .medium-pull-4{position:relative;left:-33.3333333333%}#spectacle .medium-offset-3{margin-left:25%}#spectacle .medium-5{width:41.6666666667%}#spectacle .medium-push-5{position:relative;left:41.6666666667%}#spectacle .medium-pull-5{position:relative;left:-41.6666666667%}#spectacle .medium-offset-4{margin-left:33.3333333333%}#spectacle .medium-6{width:50%}#spectacle .medium-push-6{position:relative;left:50%}#spectacle .medium-pull-6{position:relative;left:-50%}#spectacle .medium-offset-5{margin-left:41.6666666667%}#spectacle .medium-7{width:58.3333333333%}#spectacle .medium-push-7{position:relative;left:58.3333333333%}#spectacle .medium-pull-7{position:relative;left:-58.3333333333%}#spectacle .medium-offset-6{margin-left:50%}#spectacle .medium-8{width:66.6666666667%}#spectacle .medium-push-8{position:relative;left:66.6666666667%}#spectacle .medium-pull-8{position:relative;left:-66.6666666667%}#spectacle .medium-offset-7{margin-left:58.3333333333%}#spectacle .medium-9{width:75%}#spectacle .medium-push-9{position:relative;left:75%}#spectacle .medium-pull-9{position:relative;left:-75%}#spectacle .medium-offset-8{margin-left:66.6666666667%}#spectacle .medium-10{width:83.3333333333%}#spectacle .medium-push-10{position:relative;left:83.3333333333%}#spectacle .medium-pull-10{position:relative;left:-83.3333333333%}#spectacle .medium-offset-9{margin-left:75%}#spectacle .medium-11{width:91.6666666667%}#spectacle .medium-push-11{position:relative;left:91.6666666667%}#spectacle .medium-pull-11{position:relative;left:-91.6666666667%}#spectacle .medium-offset-10{margin-left:83.3333333333%}#spectacle .medium-12{width:100%}#spectacle .medium-offset-11{margin-left:91.6666666667%}#spectacle .medium-up-1>.column,#spectacle .medium-up-1>.columns,#spectacle article .medium-up-1>.doc-copy,#spectacle article .medium-up-1>.doc-examples,#spectacle article .prop-row .medium-up-1>.prop-name,#spectacle article .prop-row .medium-up-1>.prop-value{float:left;width:100%}#spectacle .medium-up-1>.column:nth-of-type(1n),#spectacle .medium-up-1>.columns:nth-of-type(1n),#spectacle article .medium-up-1>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-1>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-1>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-1>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-1>.column:nth-of-type(1n+1),#spectacle .medium-up-1>.columns:nth-of-type(1n+1),#spectacle article .medium-up-1>.doc-copy:nth-of-type(1n+1),#spectacle article .medium-up-1>.doc-examples:nth-of-type(1n+1),#spectacle article .prop-row .medium-up-1>.prop-name:nth-of-type(1n+1),#spectacle article .prop-row .medium-up-1>.prop-value:nth-of-type(1n+1){clear:both}#spectacle .medium-up-1>.column:last-child,#spectacle .medium-up-1>.columns:last-child,#spectacle article .medium-up-1>.doc-copy:last-child,#spectacle article .medium-up-1>.doc-examples:last-child,#spectacle article .prop-row .medium-up-1>.prop-name:last-child,#spectacle article .prop-row .medium-up-1>.prop-value:last-child{float:left}#spectacle .medium-up-2>.column,#spectacle .medium-up-2>.columns,#spectacle article .medium-up-2>.doc-copy,#spectacle article .medium-up-2>.doc-examples,#spectacle article .prop-row .medium-up-2>.prop-name,#spectacle article .prop-row .medium-up-2>.prop-value{float:left;width:50%}#spectacle .medium-up-2>.column:nth-of-type(1n),#spectacle .medium-up-2>.columns:nth-of-type(1n),#spectacle article .medium-up-2>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-2>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-2>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-2>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-2>.column:nth-of-type(2n+1),#spectacle .medium-up-2>.columns:nth-of-type(2n+1),#spectacle article .medium-up-2>.doc-copy:nth-of-type(2n+1),#spectacle article .medium-up-2>.doc-examples:nth-of-type(2n+1),#spectacle article .prop-row .medium-up-2>.prop-name:nth-of-type(2n+1),#spectacle article .prop-row .medium-up-2>.prop-value:nth-of-type(2n+1){clear:both}#spectacle .medium-up-2>.column:last-child,#spectacle .medium-up-2>.columns:last-child,#spectacle article .medium-up-2>.doc-copy:last-child,#spectacle article .medium-up-2>.doc-examples:last-child,#spectacle article .prop-row .medium-up-2>.prop-name:last-child,#spectacle article .prop-row .medium-up-2>.prop-value:last-child{float:left}#spectacle .medium-up-3>.column,#spectacle .medium-up-3>.columns,#spectacle article .medium-up-3>.doc-copy,#spectacle article .medium-up-3>.doc-examples,#spectacle article .prop-row .medium-up-3>.prop-name,#spectacle article .prop-row .medium-up-3>.prop-value{float:left;width:33.3333333333%}#spectacle .medium-up-3>.column:nth-of-type(1n),#spectacle .medium-up-3>.columns:nth-of-type(1n),#spectacle article .medium-up-3>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-3>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-3>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-3>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-3>.column:nth-of-type(3n+1),#spectacle .medium-up-3>.columns:nth-of-type(3n+1),#spectacle article .medium-up-3>.doc-copy:nth-of-type(3n+1),#spectacle article .medium-up-3>.doc-examples:nth-of-type(3n+1),#spectacle article .prop-row .medium-up-3>.prop-name:nth-of-type(3n+1),#spectacle article .prop-row .medium-up-3>.prop-value:nth-of-type(3n+1){clear:both}#spectacle .medium-up-3>.column:last-child,#spectacle .medium-up-3>.columns:last-child,#spectacle article .medium-up-3>.doc-copy:last-child,#spectacle article .medium-up-3>.doc-examples:last-child,#spectacle article .prop-row .medium-up-3>.prop-name:last-child,#spectacle article .prop-row .medium-up-3>.prop-value:last-child{float:left}#spectacle .medium-up-4>.column,#spectacle .medium-up-4>.columns,#spectacle article .medium-up-4>.doc-copy,#spectacle article .medium-up-4>.doc-examples,#spectacle article .prop-row .medium-up-4>.prop-name,#spectacle article .prop-row .medium-up-4>.prop-value{float:left;width:25%}#spectacle .medium-up-4>.column:nth-of-type(1n),#spectacle .medium-up-4>.columns:nth-of-type(1n),#spectacle article .medium-up-4>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-4>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-4>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-4>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-4>.column:nth-of-type(4n+1),#spectacle .medium-up-4>.columns:nth-of-type(4n+1),#spectacle article .medium-up-4>.doc-copy:nth-of-type(4n+1),#spectacle article .medium-up-4>.doc-examples:nth-of-type(4n+1),#spectacle article .prop-row .medium-up-4>.prop-name:nth-of-type(4n+1),#spectacle article .prop-row .medium-up-4>.prop-value:nth-of-type(4n+1){clear:both}#spectacle .medium-up-4>.column:last-child,#spectacle .medium-up-4>.columns:last-child,#spectacle article .medium-up-4>.doc-copy:last-child,#spectacle article .medium-up-4>.doc-examples:last-child,#spectacle article .prop-row .medium-up-4>.prop-name:last-child,#spectacle article .prop-row .medium-up-4>.prop-value:last-child{float:left}#spectacle .medium-up-5>.column,#spectacle .medium-up-5>.columns,#spectacle article .medium-up-5>.doc-copy,#spectacle article .medium-up-5>.doc-examples,#spectacle article .prop-row .medium-up-5>.prop-name,#spectacle article .prop-row .medium-up-5>.prop-value{float:left;width:20%}#spectacle .medium-up-5>.column:nth-of-type(1n),#spectacle .medium-up-5>.columns:nth-of-type(1n),#spectacle article .medium-up-5>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-5>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-5>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-5>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-5>.column:nth-of-type(5n+1),#spectacle .medium-up-5>.columns:nth-of-type(5n+1),#spectacle article .medium-up-5>.doc-copy:nth-of-type(5n+1),#spectacle article .medium-up-5>.doc-examples:nth-of-type(5n+1),#spectacle article .prop-row .medium-up-5>.prop-name:nth-of-type(5n+1),#spectacle article .prop-row .medium-up-5>.prop-value:nth-of-type(5n+1){clear:both}#spectacle .medium-up-5>.column:last-child,#spectacle .medium-up-5>.columns:last-child,#spectacle article .medium-up-5>.doc-copy:last-child,#spectacle article .medium-up-5>.doc-examples:last-child,#spectacle article .prop-row .medium-up-5>.prop-name:last-child,#spectacle article .prop-row .medium-up-5>.prop-value:last-child{float:left}#spectacle .medium-up-6>.column,#spectacle .medium-up-6>.columns,#spectacle article .medium-up-6>.doc-copy,#spectacle article .medium-up-6>.doc-examples,#spectacle article .prop-row .medium-up-6>.prop-name,#spectacle article .prop-row .medium-up-6>.prop-value{float:left;width:16.6666666667%}#spectacle .medium-up-6>.column:nth-of-type(1n),#spectacle .medium-up-6>.columns:nth-of-type(1n),#spectacle article .medium-up-6>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-6>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-6>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-6>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-6>.column:nth-of-type(6n+1),#spectacle .medium-up-6>.columns:nth-of-type(6n+1),#spectacle article .medium-up-6>.doc-copy:nth-of-type(6n+1),#spectacle article .medium-up-6>.doc-examples:nth-of-type(6n+1),#spectacle article .prop-row .medium-up-6>.prop-name:nth-of-type(6n+1),#spectacle article .prop-row .medium-up-6>.prop-value:nth-of-type(6n+1){clear:both}#spectacle .medium-up-6>.column:last-child,#spectacle .medium-up-6>.columns:last-child,#spectacle article .medium-up-6>.doc-copy:last-child,#spectacle article .medium-up-6>.doc-examples:last-child,#spectacle article .prop-row .medium-up-6>.prop-name:last-child,#spectacle article .prop-row .medium-up-6>.prop-value:last-child{float:left}#spectacle .medium-up-7>.column,#spectacle .medium-up-7>.columns,#spectacle article .medium-up-7>.doc-copy,#spectacle article .medium-up-7>.doc-examples,#spectacle article .prop-row .medium-up-7>.prop-name,#spectacle article .prop-row .medium-up-7>.prop-value{float:left;width:14.2857142857%}#spectacle .medium-up-7>.column:nth-of-type(1n),#spectacle .medium-up-7>.columns:nth-of-type(1n),#spectacle article .medium-up-7>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-7>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-7>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-7>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-7>.column:nth-of-type(7n+1),#spectacle .medium-up-7>.columns:nth-of-type(7n+1),#spectacle article .medium-up-7>.doc-copy:nth-of-type(7n+1),#spectacle article .medium-up-7>.doc-examples:nth-of-type(7n+1),#spectacle article .prop-row .medium-up-7>.prop-name:nth-of-type(7n+1),#spectacle article .prop-row .medium-up-7>.prop-value:nth-of-type(7n+1){clear:both}#spectacle .medium-up-7>.column:last-child,#spectacle .medium-up-7>.columns:last-child,#spectacle article .medium-up-7>.doc-copy:last-child,#spectacle article .medium-up-7>.doc-examples:last-child,#spectacle article .prop-row .medium-up-7>.prop-name:last-child,#spectacle article .prop-row .medium-up-7>.prop-value:last-child{float:left}#spectacle .medium-up-8>.column,#spectacle .medium-up-8>.columns,#spectacle article .medium-up-8>.doc-copy,#spectacle article .medium-up-8>.doc-examples,#spectacle article .prop-row .medium-up-8>.prop-name,#spectacle article .prop-row .medium-up-8>.prop-value{float:left;width:12.5%}#spectacle .medium-up-8>.column:nth-of-type(1n),#spectacle .medium-up-8>.columns:nth-of-type(1n),#spectacle article .medium-up-8>.doc-copy:nth-of-type(1n),#spectacle article .medium-up-8>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .medium-up-8>.prop-name:nth-of-type(1n),#spectacle article .prop-row .medium-up-8>.prop-value:nth-of-type(1n){clear:none}#spectacle .medium-up-8>.column:nth-of-type(8n+1),#spectacle .medium-up-8>.columns:nth-of-type(8n+1),#spectacle article .medium-up-8>.doc-copy:nth-of-type(8n+1),#spectacle article .medium-up-8>.doc-examples:nth-of-type(8n+1),#spectacle article .prop-row .medium-up-8>.prop-name:nth-of-type(8n+1),#spectacle article .prop-row .medium-up-8>.prop-value:nth-of-type(8n+1){clear:both}#spectacle .medium-up-8>.column:last-child,#spectacle .medium-up-8>.columns:last-child,#spectacle article .medium-up-8>.doc-copy:last-child,#spectacle article .medium-up-8>.doc-examples:last-child,#spectacle article .prop-row .medium-up-8>.prop-name:last-child,#spectacle article .prop-row .medium-up-8>.prop-value:last-child{float:left}#spectacle .medium-collapse>.column,#spectacle .medium-collapse>.columns,#spectacle article .medium-collapse>.doc-copy,#spectacle article .medium-collapse>.doc-examples,#spectacle article .prop-row .medium-collapse>.prop-name,#spectacle article .prop-row .medium-collapse>.prop-value{padding-right:0;padding-left:0}#spectacle .expanded.row .medium-collapse.row,#spectacle .expanded.row article .medium-collapse.doc-row,#spectacle .expanded.row article .medium-collapse.prop-row,#spectacle .medium-collapse .row,#spectacle .medium-collapse article .doc-row,#spectacle .medium-collapse article .prop-row,#spectacle article .expanded.doc-row .medium-collapse.doc-row,#spectacle article .expanded.doc-row .medium-collapse.prop-row,#spectacle article .expanded.doc-row .medium-collapse.row,#spectacle article .expanded.prop-row .medium-collapse.doc-row,#spectacle article .expanded.prop-row .medium-collapse.prop-row,#spectacle article .expanded.prop-row .medium-collapse.row,#spectacle article .expanded.row .medium-collapse.doc-row,#spectacle article .expanded.row .medium-collapse.prop-row,#spectacle article .medium-collapse .doc-row,#spectacle article .medium-collapse .prop-row{margin-right:0;margin-left:0}#spectacle .medium-uncollapse>.column,#spectacle .medium-uncollapse>.columns,#spectacle article .medium-uncollapse>.doc-copy,#spectacle article .medium-uncollapse>.doc-examples,#spectacle article .prop-row .medium-uncollapse>.prop-name,#spectacle article .prop-row .medium-uncollapse>.prop-value{padding-right:.9868421053rem;padding-left:.9868421053rem}#spectacle .medium-centered{margin-right:auto;margin-left:auto}#spectacle .medium-centered,#spectacle .medium-centered:last-child:not(:first-child){float:none;clear:both}#spectacle .medium-pull-0,#spectacle .medium-push-0,#spectacle .medium-uncentered{position:static;float:left;margin-right:0;margin-left:0}}@media print,screen and (min-width:64em){#spectacle .large-1{width:8.3333333333%}#spectacle .large-push-1{position:relative;left:8.3333333333%}#spectacle .large-pull-1{position:relative;left:-8.3333333333%}#spectacle .large-offset-0{margin-left:0}#spectacle .large-2{width:16.6666666667%}#spectacle .large-push-2{position:relative;left:16.6666666667%}#spectacle .large-pull-2{position:relative;left:-16.6666666667%}#spectacle .large-offset-1{margin-left:8.3333333333%}#spectacle .large-3{width:25%}#spectacle .large-push-3{position:relative;left:25%}#spectacle .large-pull-3{position:relative;left:-25%}#spectacle .large-offset-2{margin-left:16.6666666667%}#spectacle .large-4{width:33.3333333333%}#spectacle .large-push-4{position:relative;left:33.3333333333%}#spectacle .large-pull-4{position:relative;left:-33.3333333333%}#spectacle .large-offset-3{margin-left:25%}#spectacle .large-5{width:41.6666666667%}#spectacle .large-push-5{position:relative;left:41.6666666667%}#spectacle .large-pull-5{position:relative;left:-41.6666666667%}#spectacle .large-offset-4{margin-left:33.3333333333%}#spectacle .doc-content,#spectacle .large-6,#spectacle article .doc-copy,#spectacle article .doc-examples,#spectacle article .panel>h2,#spectacle article .panel>h3,#spectacle article h1.doc-title,#spectacle article>h1,#spectacle article>h2{width:50%}#spectacle .large-push-6{position:relative;left:50%}#spectacle .large-pull-6{position:relative;left:-50%}#spectacle .large-offset-5{margin-left:41.6666666667%}#spectacle .large-7{width:58.3333333333%}#spectacle .large-push-7{position:relative;left:58.3333333333%}#spectacle .large-pull-7{position:relative;left:-58.3333333333%}#spectacle .large-offset-6{margin-left:50%}#spectacle .large-8{width:66.6666666667%}#spectacle .large-push-8{position:relative;left:66.6666666667%}#spectacle .large-pull-8{position:relative;left:-66.6666666667%}#spectacle .large-offset-7{margin-left:58.3333333333%}#spectacle .large-9{width:75%}#spectacle .large-push-9{position:relative;left:75%}#spectacle .large-pull-9{position:relative;left:-75%}#spectacle .large-offset-8{margin-left:66.6666666667%}#spectacle .large-10{width:83.3333333333%}#spectacle .large-push-10{position:relative;left:83.3333333333%}#spectacle .large-pull-10{position:relative;left:-83.3333333333%}#spectacle .large-offset-9{margin-left:75%}#spectacle .large-11{width:91.6666666667%}#spectacle .large-push-11{position:relative;left:91.6666666667%}#spectacle .large-pull-11{position:relative;left:-91.6666666667%}#spectacle .large-offset-10{margin-left:83.3333333333%}#spectacle .large-12{width:100%}#spectacle .large-offset-11{margin-left:91.6666666667%}#spectacle .large-up-1>.column,#spectacle .large-up-1>.columns,#spectacle article .large-up-1>.doc-copy,#spectacle article .large-up-1>.doc-examples,#spectacle article .prop-row .large-up-1>.prop-name,#spectacle article .prop-row .large-up-1>.prop-value{float:left;width:100%}#spectacle .large-up-1>.column:nth-of-type(1n),#spectacle .large-up-1>.columns:nth-of-type(1n),#spectacle article .large-up-1>.doc-copy:nth-of-type(1n),#spectacle article .large-up-1>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-1>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-1>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-1>.column:nth-of-type(1n+1),#spectacle .large-up-1>.columns:nth-of-type(1n+1),#spectacle article .large-up-1>.doc-copy:nth-of-type(1n+1),#spectacle article .large-up-1>.doc-examples:nth-of-type(1n+1),#spectacle article .prop-row .large-up-1>.prop-name:nth-of-type(1n+1),#spectacle article .prop-row .large-up-1>.prop-value:nth-of-type(1n+1){clear:both}#spectacle .large-up-1>.column:last-child,#spectacle .large-up-1>.columns:last-child,#spectacle article .large-up-1>.doc-copy:last-child,#spectacle article .large-up-1>.doc-examples:last-child,#spectacle article .prop-row .large-up-1>.prop-name:last-child,#spectacle article .prop-row .large-up-1>.prop-value:last-child{float:left}#spectacle .large-up-2>.column,#spectacle .large-up-2>.columns,#spectacle article .large-up-2>.doc-copy,#spectacle article .large-up-2>.doc-examples,#spectacle article .prop-row .large-up-2>.prop-name,#spectacle article .prop-row .large-up-2>.prop-value{float:left;width:50%}#spectacle .large-up-2>.column:nth-of-type(1n),#spectacle .large-up-2>.columns:nth-of-type(1n),#spectacle article .large-up-2>.doc-copy:nth-of-type(1n),#spectacle article .large-up-2>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-2>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-2>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-2>.column:nth-of-type(2n+1),#spectacle .large-up-2>.columns:nth-of-type(2n+1),#spectacle article .large-up-2>.doc-copy:nth-of-type(2n+1),#spectacle article .large-up-2>.doc-examples:nth-of-type(2n+1),#spectacle article .prop-row .large-up-2>.prop-name:nth-of-type(2n+1),#spectacle article .prop-row .large-up-2>.prop-value:nth-of-type(2n+1){clear:both}#spectacle .large-up-2>.column:last-child,#spectacle .large-up-2>.columns:last-child,#spectacle article .large-up-2>.doc-copy:last-child,#spectacle article .large-up-2>.doc-examples:last-child,#spectacle article .prop-row .large-up-2>.prop-name:last-child,#spectacle article .prop-row .large-up-2>.prop-value:last-child{float:left}#spectacle .large-up-3>.column,#spectacle .large-up-3>.columns,#spectacle article .large-up-3>.doc-copy,#spectacle article .large-up-3>.doc-examples,#spectacle article .prop-row .large-up-3>.prop-name,#spectacle article .prop-row .large-up-3>.prop-value{float:left;width:33.3333333333%}#spectacle .large-up-3>.column:nth-of-type(1n),#spectacle .large-up-3>.columns:nth-of-type(1n),#spectacle article .large-up-3>.doc-copy:nth-of-type(1n),#spectacle article .large-up-3>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-3>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-3>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-3>.column:nth-of-type(3n+1),#spectacle .large-up-3>.columns:nth-of-type(3n+1),#spectacle article .large-up-3>.doc-copy:nth-of-type(3n+1),#spectacle article .large-up-3>.doc-examples:nth-of-type(3n+1),#spectacle article .prop-row .large-up-3>.prop-name:nth-of-type(3n+1),#spectacle article .prop-row .large-up-3>.prop-value:nth-of-type(3n+1){clear:both}#spectacle .large-up-3>.column:last-child,#spectacle .large-up-3>.columns:last-child,#spectacle article .large-up-3>.doc-copy:last-child,#spectacle article .large-up-3>.doc-examples:last-child,#spectacle article .prop-row .large-up-3>.prop-name:last-child,#spectacle article .prop-row .large-up-3>.prop-value:last-child{float:left}#spectacle .large-up-4>.column,#spectacle .large-up-4>.columns,#spectacle article .large-up-4>.doc-copy,#spectacle article .large-up-4>.doc-examples,#spectacle article .prop-row .large-up-4>.prop-name,#spectacle article .prop-row .large-up-4>.prop-value{float:left;width:25%}#spectacle .large-up-4>.column:nth-of-type(1n),#spectacle .large-up-4>.columns:nth-of-type(1n),#spectacle article .large-up-4>.doc-copy:nth-of-type(1n),#spectacle article .large-up-4>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-4>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-4>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-4>.column:nth-of-type(4n+1),#spectacle .large-up-4>.columns:nth-of-type(4n+1),#spectacle article .large-up-4>.doc-copy:nth-of-type(4n+1),#spectacle article .large-up-4>.doc-examples:nth-of-type(4n+1),#spectacle article .prop-row .large-up-4>.prop-name:nth-of-type(4n+1),#spectacle article .prop-row .large-up-4>.prop-value:nth-of-type(4n+1){clear:both}#spectacle .large-up-4>.column:last-child,#spectacle .large-up-4>.columns:last-child,#spectacle article .large-up-4>.doc-copy:last-child,#spectacle article .large-up-4>.doc-examples:last-child,#spectacle article .prop-row .large-up-4>.prop-name:last-child,#spectacle article .prop-row .large-up-4>.prop-value:last-child{float:left}#spectacle .large-up-5>.column,#spectacle .large-up-5>.columns,#spectacle article .large-up-5>.doc-copy,#spectacle article .large-up-5>.doc-examples,#spectacle article .prop-row .large-up-5>.prop-name,#spectacle article .prop-row .large-up-5>.prop-value{float:left;width:20%}#spectacle .large-up-5>.column:nth-of-type(1n),#spectacle .large-up-5>.columns:nth-of-type(1n),#spectacle article .large-up-5>.doc-copy:nth-of-type(1n),#spectacle article .large-up-5>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-5>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-5>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-5>.column:nth-of-type(5n+1),#spectacle .large-up-5>.columns:nth-of-type(5n+1),#spectacle article .large-up-5>.doc-copy:nth-of-type(5n+1),#spectacle article .large-up-5>.doc-examples:nth-of-type(5n+1),#spectacle article .prop-row .large-up-5>.prop-name:nth-of-type(5n+1),#spectacle article .prop-row .large-up-5>.prop-value:nth-of-type(5n+1){clear:both}#spectacle .large-up-5>.column:last-child,#spectacle .large-up-5>.columns:last-child,#spectacle article .large-up-5>.doc-copy:last-child,#spectacle article .large-up-5>.doc-examples:last-child,#spectacle article .prop-row .large-up-5>.prop-name:last-child,#spectacle article .prop-row .large-up-5>.prop-value:last-child{float:left}#spectacle .large-up-6>.column,#spectacle .large-up-6>.columns,#spectacle article .large-up-6>.doc-copy,#spectacle article .large-up-6>.doc-examples,#spectacle article .prop-row .large-up-6>.prop-name,#spectacle article .prop-row .large-up-6>.prop-value{float:left;width:16.6666666667%}#spectacle .large-up-6>.column:nth-of-type(1n),#spectacle .large-up-6>.columns:nth-of-type(1n),#spectacle article .large-up-6>.doc-copy:nth-of-type(1n),#spectacle article .large-up-6>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-6>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-6>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-6>.column:nth-of-type(6n+1),#spectacle .large-up-6>.columns:nth-of-type(6n+1),#spectacle article .large-up-6>.doc-copy:nth-of-type(6n+1),#spectacle article .large-up-6>.doc-examples:nth-of-type(6n+1),#spectacle article .prop-row .large-up-6>.prop-name:nth-of-type(6n+1),#spectacle article .prop-row .large-up-6>.prop-value:nth-of-type(6n+1){clear:both}#spectacle .large-up-6>.column:last-child,#spectacle .large-up-6>.columns:last-child,#spectacle article .large-up-6>.doc-copy:last-child,#spectacle article .large-up-6>.doc-examples:last-child,#spectacle article .prop-row .large-up-6>.prop-name:last-child,#spectacle article .prop-row .large-up-6>.prop-value:last-child{float:left}#spectacle .large-up-7>.column,#spectacle .large-up-7>.columns,#spectacle article .large-up-7>.doc-copy,#spectacle article .large-up-7>.doc-examples,#spectacle article .prop-row .large-up-7>.prop-name,#spectacle article .prop-row .large-up-7>.prop-value{float:left;width:14.2857142857%}#spectacle .large-up-7>.column:nth-of-type(1n),#spectacle .large-up-7>.columns:nth-of-type(1n),#spectacle article .large-up-7>.doc-copy:nth-of-type(1n),#spectacle article .large-up-7>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-7>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-7>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-7>.column:nth-of-type(7n+1),#spectacle .large-up-7>.columns:nth-of-type(7n+1),#spectacle article .large-up-7>.doc-copy:nth-of-type(7n+1),#spectacle article .large-up-7>.doc-examples:nth-of-type(7n+1),#spectacle article .prop-row .large-up-7>.prop-name:nth-of-type(7n+1),#spectacle article .prop-row .large-up-7>.prop-value:nth-of-type(7n+1){clear:both}#spectacle .large-up-7>.column:last-child,#spectacle .large-up-7>.columns:last-child,#spectacle article .large-up-7>.doc-copy:last-child,#spectacle article .large-up-7>.doc-examples:last-child,#spectacle article .prop-row .large-up-7>.prop-name:last-child,#spectacle article .prop-row .large-up-7>.prop-value:last-child{float:left}#spectacle .large-up-8>.column,#spectacle .large-up-8>.columns,#spectacle article .large-up-8>.doc-copy,#spectacle article .large-up-8>.doc-examples,#spectacle article .prop-row .large-up-8>.prop-name,#spectacle article .prop-row .large-up-8>.prop-value{float:left;width:12.5%}#spectacle .large-up-8>.column:nth-of-type(1n),#spectacle .large-up-8>.columns:nth-of-type(1n),#spectacle article .large-up-8>.doc-copy:nth-of-type(1n),#spectacle article .large-up-8>.doc-examples:nth-of-type(1n),#spectacle article .prop-row .large-up-8>.prop-name:nth-of-type(1n),#spectacle article .prop-row .large-up-8>.prop-value:nth-of-type(1n){clear:none}#spectacle .large-up-8>.column:nth-of-type(8n+1),#spectacle .large-up-8>.columns:nth-of-type(8n+1),#spectacle article .large-up-8>.doc-copy:nth-of-type(8n+1),#spectacle article .large-up-8>.doc-examples:nth-of-type(8n+1),#spectacle article .prop-row .large-up-8>.prop-name:nth-of-type(8n+1),#spectacle article .prop-row .large-up-8>.prop-value:nth-of-type(8n+1){clear:both}#spectacle .large-up-8>.column:last-child,#spectacle .large-up-8>.columns:last-child,#spectacle article .large-up-8>.doc-copy:last-child,#spectacle article .large-up-8>.doc-examples:last-child,#spectacle article .prop-row .large-up-8>.prop-name:last-child,#spectacle article .prop-row .large-up-8>.prop-value:last-child{float:left}#spectacle .large-collapse>.column,#spectacle .large-collapse>.columns,#spectacle article .large-collapse>.doc-copy,#spectacle article .large-collapse>.doc-examples,#spectacle article .prop-row .large-collapse>.prop-name,#spectacle article .prop-row .large-collapse>.prop-value{padding-right:0;padding-left:0}#spectacle .expanded.row .large-collapse.row,#spectacle .expanded.row article .large-collapse.doc-row,#spectacle .expanded.row article .large-collapse.prop-row,#spectacle .large-collapse .row,#spectacle .large-collapse article .doc-row,#spectacle .large-collapse article .prop-row,#spectacle article .expanded.doc-row .large-collapse.doc-row,#spectacle article .expanded.doc-row .large-collapse.prop-row,#spectacle article .expanded.doc-row .large-collapse.row,#spectacle article .expanded.prop-row .large-collapse.doc-row,#spectacle article .expanded.prop-row .large-collapse.prop-row,#spectacle article .expanded.prop-row .large-collapse.row,#spectacle article .expanded.row .large-collapse.doc-row,#spectacle article .expanded.row .large-collapse.prop-row,#spectacle article .large-collapse .doc-row,#spectacle article .large-collapse .prop-row{margin-right:0;margin-left:0}#spectacle .large-uncollapse>.column,#spectacle .large-uncollapse>.columns,#spectacle article .large-uncollapse>.doc-copy,#spectacle article .large-uncollapse>.doc-examples,#spectacle article .prop-row .large-uncollapse>.prop-name,#spectacle article .prop-row .large-uncollapse>.prop-value{padding-right:.9868421053rem;padding-left:.9868421053rem}#spectacle .large-centered{margin-right:auto;margin-left:auto}#spectacle .large-centered,#spectacle .large-centered:last-child:not(:first-child){float:none;clear:both}#spectacle .large-pull-0,#spectacle .large-push-0,#spectacle .large-uncentered{position:static;float:left;margin-right:0;margin-left:0}}#spectacle .column-block{margin-bottom:1.3157894737rem}#spectacle .column-block>:last-child{margin-bottom:0}@media print,screen and (min-width:40em){#spectacle .column-block{margin-bottom:1.9736842105rem}#spectacle .column-block>:last-child{margin-bottom:0}}#spectacle #sidebar{border-right:1px solid #eee;background-color:#f6f6f6;height:100vh;overflow:auto;position:fixed;bottom:0;left:0;top:0;width:250px;padding:1.5rem 1rem 2rem 1.5rem}#spectacle #sidebar h5{margin:1.5rem 0 .65rem;text-transform:uppercase;color:#b6b6b6;font-size:.9rem}#spectacle #sidebar a{display:block;margin:0 0 .25rem;color:#46483e;white-space:nowrap;overflow:hidden;-o-text-overflow:ellipsis;text-overflow:ellipsis}#spectacle #sidebar a.active{color:#1779ba}#spectacle #sidebar ul{list-style-type:none;padding:0;margin:0 0 .75rem .75rem}#spectacle #sidebar section>ul{display:none}#spectacle #sidebar section.expand>ul{display:block}#spectacle #sidebar .close-button{opacity:.5}#spectacle .doc-content,#spectacle article .doc-copy,#spectacle article .doc-examples,#spectacle article .panel>h2,#spectacle article .panel>h3,#spectacle article h1.doc-title,#spectacle article>h1,#spectacle article>h2{padding-left:2.25rem!important;padding-right:2.25rem!important}#spectacle .doc-separator,#spectacle article h2{margin-top:2em;padding-top:2em;padding-bottom:2em;border-top:1px solid #e2e2e2}#spectacle #docs{background:#fefefe;overflow:hidden;position:relative}#spectacle #docs .example-box{display:none}@media print,screen and (min-width:64em){#spectacle #docs .example-box{display:block;background-color:#23241f;position:absolute;right:0;top:0;bottom:0}}#spectacle article,#spectacle article .panel{position:relative}#spectacle article .no-description{color:#8a8a8a}#spectacle article dt{color:#23241f}#spectacle article table.table{width:100%}#spectacle article code{font-size:.9em;border-radius:3px}#spectacle article p:last-child:first-child{margin-bottom:0}#spectacle article h1{margin:2.5rem 0 0;border-top:1px solid #e8e8e8;border-bottom:1px solid #e2e2e2;background-color:#f6f6f6;padding:.75rem 2.25rem}#spectacle article h1.doc-title{margin:0;padding-top:2.15rem;padding-bottom:0;font-weight:700;background:0 0;border:none;color:#515448}#spectacle article .prop-row.prop-inner .prop-name,#spectacle article .prop-row.prop-inner .prop-value>span:after,#spectacle article .prop-row.prop-inner .prop-value>span:before{color:#8a8a8a}#spectacle article h1.doc-title span{display:none;opacity:.65;margin-left:5px;font-weight:400}#spectacle article h2{margin-bottom:0;padding-left:2.25rem;padding-right:2.25rem;padding-bottom:.25rem;background-image:url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgi…gd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgZmlsbD0idXJsKCNncmFkKSIgLz48L3N2Zz4g);background-size:100%;background-image:-webkit-gradient(linear,50% 0,50% 100%,color-stop(0,rgba(255,255,255,.4)),color-stop(100%,rgba(255,255,255,0)));background-image:-moz-linear-gradient(top,rgba(255,255,255,.4),rgba(255,255,255,0));background-image:-webkit-linear-gradient(top,rgba(255,255,255,.4),rgba(255,255,255,0));background-image:linear-gradient(to bottom,rgba(255,255,255,.4),rgba(255,255,255,0))}#spectacle article h3{margin:0 0 .75rem}#spectacle article h1+.panel>h2{margin-top:0;border-top:none}#spectacle article h1+.tag-description+.panel>h2{margin-top:2rem}#spectacle article h1+.panel h3{margin-top:1rem}#spectacle article .prop-row{padding-top:.75em;padding-bottom:.75em;border-top:1px solid #eee}#spectacle article .prop-row.prop-group,#spectacle article .prop-row:first-child{border-top:1px solid #ddd}#spectacle article .prop-row .prop-title{font-weight:700}#spectacle article .prop-row .prop-name{text-align:right;padding-right:.85rem!important;word-break:break-word}#spectacle article .prop-row .prop-value{padding-left:.85rem!important;word-wrap:break-word}#spectacle article .prop-row.prop-inner{padding-top:.5em;padding-bottom:.5em;font-size:80%}#spectacle article .prop-row.prop-inner .prop-value>span{display:block}#spectacle article .prop-row.prop-inner .prop-value>span.json-property-format,#spectacle article .prop-row.prop-inner .prop-value>span.json-property-type{display:inline-block}#spectacle article .doc-row{margin:2rem 0 20px}#spectacle article .doc-examples{padding-left:2.25rem!important;padding-right:2.25rem!important;color:#fefefe;background-color:#23241f}#spectacle article .doc-examples h5{color:#fefefe;font-size:1rem;opacity:.8}#spectacle article .doc-examples h5 span{opacity:.5}@media screen and (max-width:63.9375em){#spectacle article .doc-examples:not(:empty){margin-top:1.5rem;padding-top:1.5rem;padding-bottom:.5rem}}#spectacle article .doc-examples code{display:block;margin-bottom:1.5rem;padding:1.5rem;font-family:Consolas,"Liberation Mono",Courier,monospace;font-weight:inherit;color:inherit;background-color:transparent;border:none;border-top:1px solid #000;border-bottom:1px solid #404040;border-radius:5px;box-shadow:0 0 200px rgba(0,0,0,.33) inset;word-spacing:normal;white-space:pre-wrap;word-break:normal}#spectacle article .powered-by{font-size:80%;color:#cacaca}#spectacle article .powered-by span{color:#f68b1f}#spectacle article .operation .operation-tags{position:absolute;top:0;text-align:right;right:0}#spectacle article .operation .operation-tags .label{cursor:pointer}#spectacle article .operation .operation-tags .label:hover{color:#e6e6e6}@media print,screen and (min-width:64em){#spectacle article .operation .operation-tags{right:50%}}#spectacle article .operation .operation-path{word-break:break-all}#spectacle article .definition .doc-examples h5{margin-top:-1rem}#spectacle article .definition .doc-copy>section{margin-bottom:1rem}#spectacle article .definition .doc-copy>section>.json-property-type{display:none}#spectacle article .definition dl dt{font-weight:400}#spectacle article .definition dl dd{font-weight:lighter}#spectacle .hljs-strong,#spectacle article .definition .json-property-name{font-weight:700}#spectacle article .hljs{line-height:1.25;overflow-x:auto;padding:1.5rem;margin-bottom:1rem;border:none}#spectacle .drawer-layout .drawer{box-shadow:0 0 10px rgba(35,36,31,.5);transition:transform .5s ease;backface-visibility:hidden}#spectacle .drawer-layout .drawer.slide-left{transform:translateX(-250px)}#spectacle .drawer-layout .drawer.slide-right{transform:translateX(250px)}#spectacle .drawer-layout .drawer .drawer-overlay{position:absolute;top:0;left:0;right:0;bottom:0;background-color:rgba(254,254,254,.25)}@media print,screen and (min-width:64em){#spectacle .drawer-layout .drawer.slide-left{transform:none;margin-left:-250px}#spectacle .drawer-layout .drawer.slide-right{transform:none;margin-left:250px}#spectacle .drawer-layout .drawer .drawer-overlay{display:none}#spectacle .drawer-layout.drawer-slide-left-large .floating-menu-icon,#spectacle .drawer-layout.drawer-slide-right-large .floating-menu-icon{opacity:0}#spectacle .drawer-layout.drawer-slide-left-large .drawer{margin-left:-250px}#spectacle .drawer-layout.drawer-slide-right-large .drawer{margin-left:250px}}#spectacle .drawer-layout.drawer-open .floating-menu-icon{opacity:0}#spectacle .drawer-layout .floating-menu-icon{position:fixed;top:.75rem;right:.75rem;background-color:rgba(35,36,31,.75);padding:.65rem;z-index:1;border-radius:5px;transition:opacity .5s linear}#spectacle .drawer-layout .floating-menu-icon .hamburger{position:relative;display:inline-block;vertical-align:middle;width:20px;height:16px;cursor:pointer}#spectacle .drawer-layout .floating-menu-icon .hamburger::after{position:absolute;top:0;left:0;display:block;width:100%;height:2px;background:#fefefe;box-shadow:0 7px 0 #fefefe,0 14px 0 #fefefe;content:''}#spectacle .drawer-layout .floating-menu-icon .hamburger:hover::after{background:#cacaca;box-shadow:0 7px 0 #cacaca,0 14px 0 #cacaca}#spectacle .hljs{display:block;overflow-x:auto;padding:.5em;background:#23241f}#spectacle .hljs,#spectacle .hljs-subst,#spectacle .hljs-tag{color:#f8f8f2}#spectacle .hljs-emphasis,#spectacle .hljs-strong{color:#a8a8a2}#spectacle .hljs-bullet,#spectacle .hljs-link,#spectacle .hljs-literal,#spectacle .hljs-number,#spectacle .hljs-quote,#spectacle .hljs-regexp{color:#ae81ff}#spectacle .hljs-code,#spectacle .hljs-section,#spectacle .hljs-selector-class,#spectacle .hljs-title{color:#a6e22e}#spectacle .hljs-attr,#spectacle .hljs-keyword,#spectacle .hljs-name,#spectacle .hljs-selector-tag{color:#f92672}#spectacle .hljs-attribute,#spectacle .hljs-symbol{color:#66d9ef}#spectacle .hljs-class .hljs-title,#spectacle .hljs-params{color:#f8f8f2}#spectacle .hljs-addition,#spectacle .hljs-built_in,#spectacle .hljs-builtin-name,#spectacle .hljs-selector-attr,#spectacle .hljs-selector-id,#spectacle .hljs-selector-pseudo,#spectacle .hljs-string,#spectacle .hljs-template-variable,#spectacle .hljs-type,#spectacle .hljs-variable{color:#e6db74}#spectacle .hljs-comment,#spectacle .hljs-deletion,#spectacle .hljs-meta{color:#75715e}</style>
    <!--<link rel="stylesheet" href="stylesheets/foundation.min.css" />-->
    <!--<link rel="stylesheet" href="stylesheets/spectacle.min.css" />--><script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <!--<script src="javascripts/foundation.js"></script>--><script>function Traverse(a,b){this.$element=a,this.options=$.extend({},Traverse.defaults,this.$element.data(),b),this._init()}$(function(){var a=$("#sidebar");if(a.length){var b=($("#docs"),a.find("nav"));new Traverse(b,{threshold:10,barOffset:a.position().top});b.on("update.traverse",function(a,c){b.find("section").removeClass("expand");var d=c.parents("section:first");d.length&&d.addClass("expand")});var c=$(".drawer-layout"),d=c.find(".drawer"),e=function(){return d.removeClass("slide-right slide-left"),d.find(".drawer-overlay").remove(),c.removeClass("drawer-open drawer-slide-left-large drawer-slide-right-large"),!1};c.find("[data-drawer-slide]").click(function(a){var b=$(this),f=b.data("drawer-slide");c.addClass("drawer-open"),d.addClass("slide-"+f);var g=$('<a href="#" class="drawer-overlay"></a>');return d.append(g),g.click(e),!1}),c.find("[data-drawer-close]").click(e)}}),Traverse.defaults={animationDuration:500,animationEasing:"linear",threshold:50,activeClass:"active",deepLinking:!1,barOffset:0},Traverse.prototype._init=function(){var a=this.$element[0].id;this.$targets=$("[data-traverse-target]"),this.$links=this.$element.find("a"),this.$element.attr({"data-resize":a,"data-scroll":a,id:a}),this.$active=$(),this.scrollPos=parseInt(window.pageYOffset,10),this._events()},Traverse.prototype.calcPoints=function(){var a=this,b=document.body,c=document.documentElement;this.points=[],this.winHeight=Math.round(Math.max(window.innerHeight,c.clientHeight)),this.docHeight=Math.round(Math.max(b.scrollHeight,b.offsetHeight,c.clientHeight,c.scrollHeight,c.offsetHeight)),this.$targets.each(function(){var b=$(this),c=b.offset().top;b.targetPoint=c,a.points.push(c)})},Traverse.prototype._events=function(){var a=this,b=$("html, body"),c={duration:a.options.animationDuration,easing:a.options.animationEasing};$(window).one("load",function(){a.calcPoints(),a._updateActive(),$(this).resize(function(b){a.reflow()}).scroll(function(b){a._updateActive()})}),this.$element.on("click",'a[href^="#"]',function(d){d.preventDefault();var e=this.getAttribute("href").replace(".","\\."),f=$(e).offset().top-a.options.barOffset;b.stop(!0).animate({scrollTop:f},c)})},Traverse.prototype.reflow=function(){this.calcPoints(),this._updateActive()},Traverse.prototype._updateActive=function(){var a,b=parseInt(window.pageYOffset,10);if(b+this.winHeight===this.docHeight)a=this.points.length-1;else if(b<this.points[0])a=0;else{var c=this.scrollPos<b,d=this,e=this.points.filter(function(a,e){return c?a<=b+d.options.barOffset+d.options.threshold:a-(d.options.barOffset+d.options.threshold)<=b});a=e.length?e.length-1:0}var f=this.$active,g=this.$links.eq(a);if(this.$active.removeClass(this.options.activeClass),this.$active=g.addClass(this.options.activeClass),this.options.deepLinking){var h=this.$active[0].getAttribute("href");window.history.pushState?window.history.pushState(null,null,h):window.location.hash=h}this.scrollPos=b;var i=f[0]!==g[0];i&&this.$element.trigger("update.traverse",[this.$active])};</script> </head>
  <body id="spectacle">
    <div id="page" class="drawer-layout drawer-slide-right-large">
      <div id="sidebar">
        <button class="close-button" aria-label="Close menu" type="button" data-drawer-close>
          <span aria-hidden="true">×</span>
        </button>
        <nav id="nav" role="navigation">
          <h5>API Reference</h5>
          <a href="#introduction">Introduction</a>
          <!-- <h5>Security</h5> -->
          <a href="#authentication">Authentication</a>
          <h5>Operations</h5>
          <section>
            <a href="#tag-process-engine">process engine</a>
            <ul>
              <li>
                <a href="#operation--process_engine-start-post"> Starts the execution of a BPMN process </a>
              </li>
            </ul>
          </section>
          <section>
            <a href="#tag-messagebus">messagebus</a>
            <ul>
              <li>
                <a href="#operation--messagebus-publish-post"> Authenticates and returns a token </a>
              </li>
            </ul>
          </section>
          <section>
            <a href="#tag-iam">iam</a>
            <ul>
              <li>
                <a href="#operation--iam-login-post"> Authenticates and returns a token </a>
              </li>
              <li>
                <a href="#operation--iam-logout-get"> Logs the user out </a>
              </li>
              <li>
                <a href="#operation--getidentity-get"> Returns the user identity </a>
              </li>
              <li>
                <a href="#operation--getidentityentity-get"> Returns the entity for the user identity </a>
              </li>
              <li>
                <a href="#operation--validatecredentials-post"> Validates user credentials </a>
              </li>
            </ul>
          </section>
          <h5>Schema Definitions</h5>
          <a href="#definition-UserCredentials"> UserCredentials </a>
          <a href="#definition-MessagebusPublication"> MessagebusPublication </a>
          <a href="#definition-StartProcessMessage"> StartProcessMessage </a>
        </nav>
      </div>
      <div id="docs" class="row collapse expanded drawer" data-drawer>
        <button class="floating-menu-icon" type="button" data-drawer-slide="right">
          <span class="hamburger"></span>
        </button>
        <div class="example-box doc-content"></div>
        <article>
          <div id="introduction" data-traverse-target="introduction">
            <h1 class="doc-title">Process Engine HTTP REST API
              <span>API Reference</span>
            </h1>
            <div class="doc-row">
              <div class="doc-copy">
                <p>This is the static part of the BPMN Process Engine HTTP REST API.</p>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Terms of Service:
                    <a href="terms">terms</a>
                  </h5>
                  <h5>Version:
                    <span>1.0.0</span>
                  </h5>
                </section>
              </div>
            </div>
          </div>
          <!-- <h1 id="security" data-traverse-target="security">Security</h1> -->
          <h1 id="authentication" data-traverse-target="authentication">Authentication</h1>
          <div id="security-definition-Bearer" class="panel">
            <div class="doc-row">
              <div class="doc-copy">
                <h3 class="security-definition-title">
                  <span class="security-name">Bearer</span>
                  <span class="swagger-security-definition-apiKey"></span>
                </h3>
                <section class="swagger-security-definition-properties">
                  <div class="prop-row security-definition-property">
                    <div class="prop-name">
                      <div class="prop-title security-definition-property-name">name</div>
                    </div>
                    <div class="prop-value security-definition-property-type"> Authorization </div>
                  </div>
                  <div class="prop-row security-definition-property">
                    <div class="prop-name">
                      <div class="prop-title security-definition-property-name">in</div>
                    </div>
                    <div class="prop-value security-definition-property-type"> header </div>
                  </div>
                </section>
              </div>
            </div>
          </div>
          <h1 id="tag-process-engine" class="swagger-summary-tag" data-traverse-target="tag-process-engine">process engine</h1>
          <div id="operation--process_engine-start-post" class="operation panel" data-traverse-target="operation--process_engine-start-post">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-process-engine">process engine</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Starts the execution of a BPMN process</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">POST</span>
                  <span class="operation-path">/process_engine/start</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-body">
                  <div class="prop-row">
                    <div class="prop-name">
                      <div class="swagger-request-model">
                        <span class="">
                          <a class="json-schema-ref" href="#/definitions/StartProcessMessage">StartProcessMessage</a>
                        </span>
                      </div>
                    </div>
                    <div class="prop-value columns small-6">
                      <!-- <div class="swagger-request-description"> -->undefined
                      <!-- </div> -->
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Request Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">msg</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">key</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}</span>,
  &quot;<span class="hljs-attribute">options</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">id</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">applicationId</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">token</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>returns the id of the process instance you started</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <h1 id="tag-messagebus" class="swagger-summary-tag" data-traverse-target="tag-messagebus">messagebus</h1>
          <div id="operation--messagebus-publish-post" class="operation panel" data-traverse-target="operation--messagebus-publish-post">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-messagebus">messagebus</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Authenticates and returns a token</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">POST</span>
                  <span class="operation-path">/messagebus/publish</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-body">
                  <div class="prop-row">
                    <div class="prop-name">
                      <div class="swagger-request-model">
                        <span class="">
                          <a class="json-schema-ref" href="#/definitions/MessagebusPublication">MessagebusPublication</a>
                        </span>
                      </div>
                    </div>
                    <div class="prop-value columns small-6">
                      <!-- <div class="swagger-request-description"> -->undefined
                      <!-- </div> -->
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Request Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">channel</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
  &quot;<span class="hljs-attribute">msg</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;object&quot;</span></span>,
  &quot;<span class="hljs-attribute">options</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">id</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">applicationId</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">token</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <h1 id="tag-iam" class="swagger-summary-tag" data-traverse-target="tag-iam">iam</h1>
          <div id="operation--iam-login-post" class="operation panel" data-traverse-target="operation--iam-login-post">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-iam">iam</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Authenticates and returns a token</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">POST</span>
                  <span class="operation-path">/iam/login</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-body">
                  <div class="prop-row">
                    <div class="prop-name">
                      <div class="swagger-request-model">
                        <span class="">
                          <a class="json-schema-ref" href="#/definitions/UserCredentials">UserCredentials</a>
                        </span>
                      </div>
                    </div>
                    <div class="prop-value columns small-6">
                      <!-- <div class="swagger-request-description"> -->undefined
                      <!-- </div> -->
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Request Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">username</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
  &quot;<span class="hljs-attribute">password</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <div id="operation--iam-logout-get" class="operation panel" data-traverse-target="operation--iam-logout-get">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-iam">iam</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Logs the user out</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">GET</span>
                  <span class="operation-path">/iam/logout</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy"> </div>
              <div class="doc-examples"></div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-security">
                  <table class="table">
                    <thead>
                      <tr>
                        <th class="swagger-request-security-schema"></th>
                        <th class="swagger-request-security-scopes"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <a href="#security-definition-Bearer">Bearer</a>
                        </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>
                </section>
              </div>
            </div>
          </div>
          <div id="operation--getidentity-get" class="operation panel" data-traverse-target="operation--getidentity-get">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-iam">iam</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Returns the user identity</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">GET</span>
                  <span class="operation-path">/getidentity</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy"> </div>
              <div class="doc-examples"></div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-security">
                  <table class="table">
                    <thead>
                      <tr>
                        <th class="swagger-request-security-schema"></th>
                        <th class="swagger-request-security-scopes"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <a href="#security-definition-Bearer">Bearer</a>
                        </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>
                </section>
              </div>
            </div>
          </div>
          <div id="operation--getidentityentity-get" class="operation panel" data-traverse-target="operation--getidentityentity-get">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-iam">iam</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Returns the entity for the user identity</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">GET</span>
                  <span class="operation-path">/getidentityentity</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy"> </div>
              <div class="doc-examples"></div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-security">
                  <table class="table">
                    <thead>
                      <tr>
                        <th class="swagger-request-security-schema"></th>
                        <th class="swagger-request-security-scopes"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <a href="#security-definition-Bearer">Bearer</a>
                        </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>
                </section>
              </div>
            </div>
          </div>
          <div id="operation--validatecredentials-post" class="operation panel" data-traverse-target="operation--validatecredentials-post">
            <!-- <section class="operation-tags row"> -->
            <!-- <div class="doc-copy"> -->
            <div class="operation-tags">
              <a class="label" href="#tag-iam">iam</a>
              <!---->
            </div>
            <!-- </div> -->
            <!-- </section> -->
            <h2 class="operation-title">
              <span class="operation-summary">Validates user credentials</span>
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-operation-path">
                  <span class="operation-method">POST</span>
                  <span class="operation-path">/validatecredentials</span>
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-body">
                  <div class="prop-row">
                    <div class="prop-name">
                      <div class="swagger-request-model">
                        <span class="">
                          <a class="json-schema-ref" href="#/definitions/UserCredentials">UserCredentials</a>
                        </span>
                      </div>
                    </div>
                    <div class="prop-value columns small-6">
                      <!-- <div class="swagger-request-description"> -->undefined
                      <!-- </div> -->
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Request Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">username</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
  &quot;<span class="hljs-attribute">password</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-responses">
                  <div class="prop-row prop-group">
                    <div class="prop-name">
                      <div class="prop-title">200 OK</div>
                      <div class="prop-ref"></div>
                      <!-- <span class="swagger-global"></span> <span class="json-schema-reference"><a href=""></a></span> -->
                    </div>
                    <div class="prop-value">
                      <p>successful operation</p>
                    </div>
                  </div>
                </section>
              </div>
              <div class="doc-examples">
                <h5>Response Content-Types:
                  <span>application/json</span>
                </h5>
                <section>
                  <h5>Response Example
                    <span>(200 OK)</span>
                  </h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json"><span class="hljs-string">&quot;string&quot;</span>
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="swagger-request-security">
                  <table class="table">
                    <thead>
                      <tr>
                        <th class="swagger-request-security-schema"></th>
                        <th class="swagger-request-security-scopes"></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <a href="#security-definition-Bearer">Bearer</a>
                        </td>
                        <td> </td>
                      </tr>
                    </tbody>
                  </table>
                </section>
              </div>
            </div>
          </div>
          <h1>Schema Definitions</h1>
          <div id="definition-UserCredentials" class="definition panel" data-traverse-target="definition-UserCredentials">
            <h2 class="panel-title">
              <a name="/definitions/UserCredentials"></a>UserCredentials:
              <!-- <span class="json-property-type"><span class="json-property-type">object</span>
              <span class="json-property-range" title="Value limits"></span>
              
              
              </span> -->
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="json-schema-description">
                  <p>user credentials</p>
                </section>
                <section class="json-schema-properties">
                  <dl>
                    <dt data-property-name="username" class="has-description">
                      <span class="json-property-name">username:</span>
                      <span class="json-property-type">string</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>the user name</p>
                    </dd>
                    <dt data-property-name="password" class="has-description">
                      <span class="json-property-name">password:</span>
                      <span class="json-property-type">string</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>the users password</p>
                    </dd>
                  </dl>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">username</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
  &quot;<span class="hljs-attribute">password</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <div id="definition-MessagebusPublication" class="definition panel" data-traverse-target="definition-MessagebusPublication">
            <h2 class="panel-title">
              <a name="/definitions/MessagebusPublication"></a>MessagebusPublication:
              <!-- <span class="json-property-type"><span class="json-property-type">object</span>
              <span class="json-property-range" title="Value limits"></span>
              
              
              </span> -->
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="json-schema-description">
                  <p>a message that can be published on the messagebus</p>
                </section>
                <section class="json-schema-properties">
                  <dl>
                    <dt data-property-name="channel" class="has-description">
                      <span class="json-property-name">channel:</span>
                      <span class="json-property-type">string</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>the channel the message will be published on</p>
                    </dd>
                    <dt data-property-name="msg" class="has-description">
                      <span class="json-property-name">msg:</span>
                      <span class="json-property-type">object</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>the content of your message</p>
                    </dd>
                    <dt data-property-name="options" class="has-description">
                      <span class="json-property-name">options:</span>
                      <span class="json-property-type">object</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>additional query options for your message publication</p>
                    </dd>
                  </dl>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">channel</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
  &quot;<span class="hljs-attribute">msg</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;object&quot;</span></span>,
  &quot;<span class="hljs-attribute">options</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">id</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">applicationId</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">token</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <div id="definition-StartProcessMessage" class="definition panel" data-traverse-target="definition-StartProcessMessage">
            <h2 class="panel-title">
              <a name="/definitions/StartProcessMessage"></a>StartProcessMessage:
              <!-- <span class="json-property-type"><span class="json-property-type">object</span>
              <span class="json-property-range" title="Value limits"></span>
              
              
              </span> -->
            </h2>
            <div class="doc-row">
              <div class="doc-copy">
                <section class="json-schema-description">
                  <p>the message to start a BPMN process</p>
                </section>
                <section class="json-schema-properties">
                  <dl>
                    <dt data-property-name="msg">
                      <span class="json-property-name">msg:</span>
                      <span class="json-property-type">object</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dt data-property-name="options" class="has-description">
                      <span class="json-property-name">options:</span>
                      <span class="json-property-type">object</span>
                      <span class="json-property-range" title="Value limits"></span>
                    </dt>
                    <dd>
                      <p>additional query options for the process you want to start</p>
                    </dd>
                  </dl>
                </section>
              </div>
              <div class="doc-examples">
                <section>
                  <h5>Example</h5>
                  <!-- <div class="hljs"> --><pre><code class="hljs lang-json">{
  &quot;<span class="hljs-attribute">msg</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">key</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}</span>,
  &quot;<span class="hljs-attribute">options</span>&quot;: <span class="hljs-value">{
    &quot;<span class="hljs-attribute">id</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">applicationId</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span></span>,
    &quot;<span class="hljs-attribute">token</span>&quot;: <span class="hljs-value"><span class="hljs-string">&quot;string&quot;</span>
  </span>}
</span>}
</code></pre>
                  <!-- </div> -->
                </section>
              </div>
            </div>
          </div>
          <div class="doc-row no-margin">
            <div class="doc-copy doc-separator">
              <a class="powered-by" href="https://sourcey.com/spectacle">Documentation by
                <span>Spectacle</span>
              </a>
            </div>
          </div>
        </article>
      </div>
    </div>
  </body>
</html>
