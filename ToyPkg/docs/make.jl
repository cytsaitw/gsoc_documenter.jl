using Documenter
using ToyPkg
using DocumenterGiscus # <--- 匯入你剛寫好的套件！

# 設定 DocMeta
DocMeta.setdocmeta!(ToyPkg, :DocTestSetup, :(using ToyPkg); recursive=true)

# 1. 準備 Giscus 設定 (填入你的真實 ID)
giscus_config = GiscusConfiguration(
    "Your account/ToyPkg.jl",
    "R_kgDOK...",      # Repo ID
    "Announcements",   # Category Name
    "DIC_kwDOK...",    # Category ID
    "pathname"
)

const DOCS_PAGES = [
    "Home"     => "index.md",
    "Tutorial" => "tutorial.md",
    "API"      => "api.md",
]

html_format = Documenter.HTML(
    prettyurls = false,
    edit_link = "main",
)

println(" 開始建置文件...")

# 第一階段：標準生成
doc = makedocs(
    sitename = "ToyPkg.jl",
    modules  = [ToyPkg],
    pages    = DOCS_PAGES,
    format   = html_format,
    warnonly = true,
    remotes  = nothing,
    debug    = true, # 記得開 debug 拿 doc 物件
)

if doc !== nothing
    println(" 正在注入 Giscus 評論區...")
    
    # 呼叫你套件裡的函式！
    inject_giscus!(doc, giscus_config)
    
    println(" 重新渲染 HTML...")
    Documenter.Writers.HTMLWriter.render(doc, html_format)
    
    println(" 完成！")
else
    error("makedocs 回傳 nothing")
end