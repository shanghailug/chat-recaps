
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |respo.calcit/ |respo-ui.calcit/
      :type-slots $ {} $ :dispatch-op 'app.schema/Action
  :files $ {}
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (recap)
            let
                filtered $ filter data/messages $ fn (msg)
                  = recap $ .unwrap-or (get msg :recap) |
              div
                {} $ :style $ merge ui/global ui/column
                div
                  {} $ :style $ merge ui/center
                    {} (:height 80) (:background-color "|hsl(240,40%,50%)") (:color :white)
                  span
                    {} $ :style $ {} (:font-size 28) (:font-family ui/font-fancy)
                    <> "|Chat Recaps"
                div
                  {} $ :style $ merge ui/row
                    {} (:padding "|8px 16px") (:border-bottom "|1px solid #eee")
                  button $ {} (:inner-text "|001 OCR") (:style ui/button)
                    :on-click $ fn (e d!)
                      d! $ schema/Action :set-recap |001
                  =< 8 nil
                  button $ {} (:inner-text "|002 Agile") (:style ui/button)
                    :on-click $ fn (e d!)
                      d! $ schema/Action :set-recap |002
                list->
                  {} $ :style $ merge ui/expand
                    {} $ :overflow :auto
                  map-indexed filtered $ fn (idx msg)
                    [] idx $ comp-message msg
          :examples $ []
          :schema $ quote $ Fn String (-> respo.schema/Component)
        'comp-message $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-message (msg)
            div
              {} $ :style $ merge ui/row
                {} (:padding "|6px 16px") (:align-items :flex-start)
              span
                {} $ :style $ {} (:width 120) (:font-weight 600) (:color |#555)
                <> $ .unwrap-or (get msg :author) |
              span
                {} $ :style $ {} (:flex 1) (:white-space :pre-wrap)
                <> $ .unwrap-or (get msg :text) |
          :examples $ []
          :schema $ quote $ Fn (Map Tag String) (-> respo.schema/Component)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require (respo-ui.core :as ui)
            respo.core :refer $ defcomp div span button <> list->
            respo.comp.space :refer $ =<
            app.schema :as schema
            app.data :as data
    'app.data $ %{} 'FileEntry
      :defs $ {} $ 'messages
        %{} 'CodeEntry (:doc |)
          :code $ quote $ def messages
            []
              {} (:recap |001) (:author |Bot) (:text "|(2017年某一天)")
              {} (:recap |001) (:author |Perchouli)
                :text "|OCR识别中文，精度要求不高。图片文字有点模糊但没有混淆。是找现成的普通OCR库就能解决，还是用机器学习训练更好？（现有OCR API要收费不考虑了）"
              {} (:recap |001) (:author "|刘怿斯") (:text "|没有手写吧？")
              {} (:recap |001) (:author |Perchouli) (:text "|没有")
              {} (:recap |001) (:author "|刘怿斯") (:text "|有train好的dl模型")
              {} (:recap |001) (:author "|Michael Moore") (:text "|共享一下 @刘怿斯  ")
              {} (:recap |001) (:author "|刘怿斯") (:text |https://arxiv.org/abs/1505.07675)
              {} (:recap |001) (:author "|刘怿斯")
                :text "|https://github.com/JinpengLI/deep_ocr 大家可以参考一下这个"
              {} (:recap |001) (:author "|刘怿斯") (:text "|自己train的话 没有data 很现实的问题")
              {} (:recap |001) (:author |Perchouli)
                :text "|是的… 之前试过TF来train，训练集比较麻烦满足不了要求（主要是生僻和异体字）… deep_ocr这个是caffee的，请问是否有基于其他框架的？"
              {} (:recap |001) (:author "|Michael Moore") (:text "|[抱拳]")
              {} (:recap |001) (:author "|苦修者") (:text "|可不可以可以考虑下用halcon的字符集来训练啊？")
              {} (:recap |001) (:author "|刘怿斯")
                :text "|https://github.com/soloice/Chinese-Character-Recognition 这个我没试过 但是是tf的"
              {} (:recap |001) (:author |Perchouli) (:text "|太感谢了！刚才没search到 [抱拳]")
              {} (:recap |001) (:author "|YùChāngyuǎn") (:text "|ocr为什么要train啊，应该图片很干净的吧")
              {} (:recap |001) (:author "|刘怿斯") (:text "|他也提供了pretrained的model 试过了麻烦分享一下效果哈")
              {} (:recap |001) (:author "|刘怿斯") (:text "|@YùChāngyuǎn 像素问题 很有可能模糊")
              {} (:recap |001) (:author "|YùChāngyuǎn") (:text "|分辨率不够？")
              {} (:recap |001) (:author |Perchouli) (:text "|嗯，分别率不够和一些缺损")
              {} (:recap |001) (:author "|YùChāngyuǎn") (:text "|觉得量不大可以自动识别加人工校对，可能比较方便")
              {} (:recap |001) (:author "|小面包") (:text "|中文OCR 以前的紫光，还有方正有做的特别好的。")
              {} (:recap |001) (:author "|小面包") (:text "|可惜，技术被饿死了。")
              {} (:recap |001) (:author |Bot) (:text "|(播放完成)")
              {} (:recap |002) (:author |Bot) (:text "|(2017年某一天)")
              {} (:recap |002) (:author "|风的一天") (:text "|各位大佬 敏捷开发 在国内实施不开 你们觉得问题是什么呢 怎么整改呢？")
              {} (:recap |002) (:author |Liangdi) (:text "|@风的一天 我们在做 可以交流")
              {} (:recap |002) (:author "|小火") (:text "|施展不开吗。。。")
              {} (:recap |002) (:author "|类库大魔王") (:text "|管理的问题，习惯的力量")
              {} (:recap |002) (:author |Liangdi) (:text "|对团队要求蛮高")
              {} (:recap |002) (:author "|小火") (:text "|我觉得我们就施展的很好啊...")
              {} (:recap |002) (:author "|类库大魔王") (:text "|我们也在做，没觉得对团队要求高")
              {} (:recap |002) (:author "|风的一天") (:text "|[擦汗]")
              {} (:recap |002) (:author "|风的一天") (:text "|为何差异这么大")
              {} (:recap |002) (:author "|小火") (:text "|流程+工具")
              {} (:recap |002) (:author "|类库大魔王") (:text "|先问问，你们遇到什么问题了？")
              {} (:recap |002) (:author "|风的一天")
                :text "|公司的敏捷 从领导的态度来看 他们觉得敏捷就是让员工加速开发 就是加班[擦汗] 软件质量低下 维护性差 按说敏捷开发软件质量很好才对啊"
              {} (:recap |002) (:author |Liangdi) (:text "|领导都没有理解敏捷啊")
              {} (:recap |002) (:author |Liangdi) (:text "|怎么实施")
              {} (:recap |002) (:author "|类库大魔王")
                :text "|所以说是管理的问题，我们这里敏捷了，做实际上做得很慢，从不加班，到了deadline了，完成不了的feature就直接砍掉也要发新版本"
              {} (:recap |002) (:author |wormwang) (:text "|@风的一天 敏捷是跟踪需求，不管质量的。软件质量管理是另外的")
              {} (:recap |002) (:author "|小火")
                :text "|敏捷应该是 原来是一个版本做的事 我现在分散到十个版本来做 开发者应该把更多的时间放在划水上才是😂"
              {} (:recap |002) (:author "|风的一天") (:text "|但敏捷的定义 太宽泛 大家都有自己的理解 谁也说服不了谁啊")
              {} (:recap |002) (:author |wormwang) (:text "|软件开发管理是最困难的之一。比管理富士康100万人都麻烦")
              {} (:recap |002) (:author "|类库大魔王") (:text "|敏捷不是发版本快的意思，是需求或计划改变了能很快跟上")
              {} (:recap |002) (:author |Liangdi) (:text "|用scrum吗")
              {} (:recap |002) (:author "|类库大魔王") (:text "|我们这是scrum")
              {} (:recap |002) (:author "|类库大魔王") (:text "|每个team有个scrum master")
              {} (:recap |002) (:author |wormwang) (:text "|我是：agile, CD, pair prog, TDD综合起来自己搞了个体系。做的效果还好")
              {} (:recap |002) (:author "|风的一天")
                :text "|[擦汗]@wormwang 回头来我们部门 推广一下敏捷吧 感觉大家都是盲人摸象 道听途说 搞不清楚"
              {} (:recap |002) (:author |shiquan) (:text "|拥抱变化，首先是mindset的问题，这个搞定了就敏捷了")
              {} (:recap |002) (:author |Liangdi) (:text "|敏捷宣言 和 对应方法的一下方法论 先在公司层面统一一下")
              {} (:recap |002) (:author |wormwang) (:text "|@风的一天 你们那头是谁？")
              {} (:recap |002) (:author |Liangdi) (:text "|不然没法实施啊 对技术团队要求也是蛮高的")
              {} (:recap |002) (:author "|类库大魔王") (:text "|我们不用TDD，但是几乎每个新feature提交代码都会补上UT和ST")
              {} (:recap |002) (:author "|类库大魔王") (:text "|是后补的")
              {} (:recap |002) (:author |wormwang) (:text "|@风的一天 我只是分享我的做法。我不教条主义用哪个")
              {} (:recap |002) (:author "|类库大魔王") (:text "|但是同一次提交的")
              {} (:recap |002) (:author "|类库大魔王") (:text "|关键看领导，敏捷不是银弹")
              {} (:recap |002) (:author |wormwang)
                :text "|我用TDD思路。让上下有关的人，互相写测试程序。互相调的模块级互相写。不教条搞UT. UT 太细，要求高的软件，再做UT"
              {} (:recap |002) (:author |wormwang) (:text "|相当于模块级的TDD, 并且不是program自己写，他的消费者写")
              {} (:recap |002) (:author |wormwang) (:text "|他的消费者写的TDD，对自己利益忧关，必定写的。并且能发现生产者忽略的事")
              {} (:recap |002) (:author "|风的一天")
                :text "|“所以说是管理的问题，我们这里敏捷了，做实际上做得很慢，从不加班，到了deadline了，完成不了的feature就直接砍掉也要发新版本” 我们完全相反"
              {} (:recap |002) (:author "|风的一天") (:text "|业务方的需求很少拒绝 绝大多数需求都是p0 加班加点满足业务的需求 @类库大魔王")
              {} (:recap |002) (:author "|风的一天") (:text "|@wormwang 很合理，也很有效")
              {} (:recap |002) (:author "|类库大魔王") (:text "|这是重市场不重研发啊")
              {} (:recap |002) (:author "|类库大魔王") (:text "|怎么可能绝大多数需求都是p0，根本做不到")
              {} (:recap |002) (:author |izak) (:text "|怎么可能绝大多数需求都是p0，根本做不到")
              {} (:recap |002) (:author "|类库大魔王")
                :text "|我们到发版本前一个月多，就开始评估新bug，如果是老版本也有的bug就直接降级到S4或更低，要下个版本再解决了（甚至可能拖几年"
              {} (:recap |002) (:author |izak) (:text "|哇可以拖几年的项目是做的什么")
              {} (:recap |002) (:author "|类库大魔王") (:text "|新feature倒是发版本前两个月基本能代码完成，后面都是测试了")
              {} (:recap |002) (:author "|风的一天") (:text "|[抠鼻]")
              {} (:recap |002) (:author "|类库大魔王") (:text "|一个企业IM")
              {} (:recap |002) (:author "|类库大魔王") (:text "|反正我看到过很多个已经几百天没解决的bug了")
              {} (:recap |002) (:author |shiquan) (:text "|钉钉？")
              {} (:recap |002) (:author "|类库大魔王") (:text "|Cisco Jabber")
              {} (:recap |002) (:author "|风的一天") (:text "|我也想使用TDD 但是直观感受 是 TDD 会拖慢项目进度 不知道大佬们有什么看法")
              {} (:recap |002) (:author "|类库大魔王") (:text "|是会慢")
              {} (:recap |002) (:author "|类库大魔王") (:text "|要加UT就会慢")
              {} (:recap |002) (:author |??) (:text "|脑内TDD")
              {} (:recap |002) (:author "|类库大魔王") (:text "|所以敏捷不能快速上线发布。。。")
              {} (:recap |002) (:author |??) (:text "|一边脑补一边写（")
              {} (:recap |002) (:author |wormwang) (:text "|模块级TDD")
              {} (:recap |002) (:author |wormwang) (:text "|或者用覆盖较细的UAT、ST当TDD")
              {} (:recap |002) (:author "|类库大魔王") (:text "|ST比UT更难写")
              {} (:recap |002) (:author "|类库大魔王") (:text "|调死人了")
              {} (:recap |002) (:author |Liangdi) (:text "|什么时候月度交流可以搞次敏捷的交流")
              {} (:recap |002) (:author "|类库大魔王") (:text "|可以叫个scrum master去")
              {} (:recap |002) (:author |Perchouli)
                :text "|之前公司雇过号称CST专家的参与team指导过scrum，然而相比之前提升并不大… 各家做法不同的"
              {} (:recap |002) (:author "|类库大魔王") (:text "|但实际上一般只有从事相关管理工作的人才有兴趣")
              {} (:recap |002) (:author "|YùChāngyuǎn") (:text "|我觉得，软件工作人员要往上走，还是要了解这方面的")
              {} (:recap |002) (:author "|YùChāngyuǎn") (:text "|如果垂直看，就是管理，但水平看，就是合作")
              {} (:recap |002) (:author |shiquan) (:text "|合作模式要靠磨合吧，可以有些参考，照搬一般都不会执行的很好")
              {} (:recap |002) (:author "|风的一天") (:text "|我觉得一个高手必定要带领一队人才能搞成大项目啊 你再高手 也写不完啊")
              {} (:recap |002) (:author "|类库大魔王") (:text "|话是这么说，但事实是从业3，4年人开发者往往并不感兴趣，除非他有意识地想往管理方向转")
              {} (:recap |002) (:author |Perchouli) (:text "|那可以让高手写个详设然后code工作外包出去做…")
              {} (:recap |002) (:author |wormwang)
                :text "|推荐：人月神话，人件，agile program, TDD , CMM， UML 都看一下。深入理解"
              {} (:recap |002) (:author "|类库大魔王") (:text "|而且很多国内小厂的管理者也都是野路子方式管理，并没有系统地学过方法论")
              {} (:recap |002) (:author "|彰玉") (:text "|人月神话 这种真的是大型项目。我感觉互联网里的理念就不会有这重量级的项目")
              {} (:recap |002) (:author |wormwang) (:text "|@彰玉 人月神话讲的是一部分规律。一部分反面例子。帮助理解 Agile program")
              {} (:recap |002) (:author "|彰玉") (:text "|@wormwang 我是说。人月神话这种东东在不同的时间点。要做不同的理解")
              {} (:recap |002) (:author |Perchouli) (:text "|个人常会推荐软件工程的事实与谬误，不长，引用的资料也比较经典，当索引看")
              {} (:recap |002) (:author |wormwang)
                :text "|CMM与agile progam 对比一起读，也是为了更好的理解。包括， agile 里应用UML的部分"
              {} (:recap |002) (:author "|YùChāngyuǎn") (:text "|都是方法论")
              {} (:recap |002) (:author "|风的一天") (:text "|[捂脸] 目前比较好理解的工具就是TDD了 用起来 有什么经验么 大佬们")
              {} (:recap |002) (:author |Perchouli)
                :text "|TDD的几本书到现在也十多年了吧… 至今没在工作中成功实践过…thoughtwork自己用+布道听过很多，但国内第三方的成功经验貌似没听到过，同求经验分享…"
              {} (:recap |002) (:author |wormwang) (:text "|模块级TDD")
              {} (:recap |002) (:author |wormwang) (:text "|系统软件里有UT覆盖要求，到97%，甚至100%，不过很多人还是后补UT的")
              {} (:recap |002) (:author "|风的一天") (:text "|还是多读书多交流 不然看到的不是太抽象就是看到的太局限")
              {} (:recap |002) (:author |Bot) (:text "|(播放完成)")
          :examples $ []
          :schema $ quote $ List (Map Tag String)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.data
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*recap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *recap |001
          :examples $ []
          :schema $ quote $ Ref String
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (action)
            match action $
              :set-recap code
              reset! *recap code
            , &unit
          :examples $ []
          :schema $ quote $ Fn schema/Action (-> Unit) (:features :state)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println "|Chat Recaps started.") (render-app!)
            add-watch! *recap :changes $ fn (s p) (render-app!)
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            .unwrap $ query-selector |.app
          :examples $ []
          :schema $ quote respo.dom/DomElement
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors)
              do (remove-watch! *recap :changes) (render-app!)
                add-watch! *recap :changes $ fn (s p) (render-app!)
              , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render-with! mount-target
              fn () $ comp-container @*recap
              , dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :io :js-ffi :state)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            respo.core :refer $ render-with!
            respo.ffi.browser :refer $ query-selector
            app.comp.container :refer $ comp-container
            app.schema :as schema
            |./calcit.build-errors :default build-errors
    'app.schema $ %{} 'FileEntry
      :defs $ {} $ 'Action
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defenum Action (:set-recap String)
          :examples $ []
          :schema $ quote EnumDef
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
