# 這裡不需要寫 module，因為它會被 include 到主 module 裡

# 1. 定義設定檔結構
struct GiscusConfiguration
    repo::String
    repo_id::String
    category::String
    category_id::String
    mapping::String
end

# 2. 定義 AST 節點
struct GiscusBlock <: MarkdownAST.AbstractBlock
    config::GiscusConfiguration
end

# 3. 定義 HTML 渲染邏輯
function domify(dctx::DCtx, node::MarkdownAST.Node, e::GiscusBlock)
    @tags div script
    
    cfg = e.config
    
    return div[".giscus-container", :style => "margin-top: 3rem; border-top: 1px solid #eaecef; padding-top: 2rem;"](
        script[
            :src => "https://giscus.app/client.js",
            Symbol("data-repo") => cfg.repo,
            Symbol("data-repo-id") => cfg.repo_id,
            Symbol("data-category") => cfg.category,
            Symbol("data-category-id") => cfg.category_id,
            Symbol("data-mapping") => cfg.mapping,
            Symbol("data-strict") => "0",
            Symbol("data-reactions-enabled") => "1",
            Symbol("data-emit-metadata") => "0",
            Symbol("data-input-position") => "bottom",
            Symbol("data-theme") => "preferred_color_scheme",
            Symbol("data-lang") => "en-US",
            :crossorigin => "anonymous",
            :async => ""
        ]()
    )
end

# 4. 定義搜尋索引邏輯
function mdflatten(io::IO, node::MarkdownAST.Node, e::GiscusBlock)
    return nothing # 評論區不參與搜尋
end