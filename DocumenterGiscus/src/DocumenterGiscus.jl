module DocumenterGiscus

using Documenter
using MarkdownAST
# 引入必要的 Documenter 內部工具，供 GiscusBlock.jl 使用
import Documenter.Writers.HTMLWriter: domify, DCtx
import Documenter.MDFlatten: mdflatten
using Documenter.DOM: @tags

# 匯出功能給使用者
export GiscusConfiguration, inject_giscus!

# 關鍵：在這裡引入另一個檔案
include("GiscusBlock.jl")

# 5. 定義注入函式 (這是對使用者的高層介面，留在主檔案很適合)
function inject_giscus!(doc::Documenter.Document, config::GiscusConfiguration)
    for (path, page) in doc.blueprint.pages
        # 建立節點
        giscus_node = MarkdownAST.Node(GiscusBlock(config))
        # 注入到頁面底部
        push!(page.mdast.children, giscus_node)
    end
    @info "Giscus comments successfully injected into $(length(doc.blueprint.pages)) pages."
end

end # module