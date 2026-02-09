using Test
using Documenter
using ToyPkg

# 設定 DocMeta (這行很重要，確保測試環境能正確載入套件)
# 雖然你的 make.jl 也有這行，但測試環境是獨立運作的，這裡也需要
DocMeta.setdocmeta!(ToyPkg, :DocTestSetup, :(using ToyPkg); recursive=true)

@testset "Doctests" begin
    # 這行指令會掃描 src/ 下的所有檔案，找出 jldoctest區塊並執行
    doctest(ToyPkg)
end