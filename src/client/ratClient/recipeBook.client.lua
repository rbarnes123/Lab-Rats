-- shows recipe book for potion puzzle for each player
--services
local players = game:GetService("Players")
-- parts used
local playerGUI = players.LocalPlayer:WaitForChild("PlayerGui")
local recipeBook = playerGUI:WaitForChild("RecipeBook")
--left page GUI
local leftPage = recipeBook:WaitForChild("leftPage")
local lName = leftPage.name
local lDesc = leftPage.description
local lRecipe = leftPage.recipe
local prevPage = leftPage.prev

--right Page GUI
local rightPage = recipeBook:WaitForChild("rightPage")
local rName = rightPage.name
local rDesc = rightPage.description
local rRecipe = rightPage.recipe
local nextPage = rightPage.next
local close = rightPage.close

--bookshelf
local bookShelf = game.Workspace.potionRoom:WaitForChild("bookShelf")
local recipes = bookShelf:WaitForChild("recipes")
local open = recipes:WaitForChild("open")

-- control vars
-- index of pages 
local leftIndex = 1
local rightIndex = 2
-- name array
local names = {
    "Reddium",
    "Azulite",
    "Goldora",
    "Obscurite",
    "Verdium",
    "Omnium",
    "Rat Serum",
    ""
}
-- description array
local descriptions = {
    "One of life's base elements\nAdd for vigor",
    "An unermarkable element in all ways but its stench\nAdd for soul",
    "Its shine cannot be ignored\nI hope it does something",
    "A mysterious goop made by accident\nIt is absolutely essential!",
    "The botanist's miracle\nRevitalizes the body",
    "An element with extraordinary properties and cost\nOnly the royal alchemist is trusted to handle it\nMay they never find the truth",
    "The secret to life itself",
    ""
}
-- recipe array
local recipes = {
    "",
    "",
    "",
    "Reddium + Azulite",
    "Azulite + Goldora",
    "Azulite + Goldora + Reddium + Obscurite + Verdium",
    "1. Add Cooked Verdium \n2. Add Obscurite\n3.Add Mix of Verdium and Goldora\n4.Add Crispy Reddium\n5. Add Omnium",
    ""
}

-- sets pages based on index
local function setPages()
    -- left page
    lName.Text = names[leftIndex]
    lDesc.Text = descriptions[leftIndex]
    lRecipe.Text = recipes[leftIndex]
    -- right page
    rName.Text = names[rightIndex]
    rDesc.Text = descriptions[rightIndex]
    rRecipe.Text = recipes[rightIndex]
end
-- goes back a page
prevPage.MouseButton1Click:Connect(function()
    if leftIndex > 1 then
        leftIndex = leftIndex - 2
        rightIndex = rightIndex - 2
        setPages()
    end 

end)
-- goes forward a page
nextPage.MouseButton1Click:Connect(function()
    if rightIndex < 8 then
        leftIndex = leftIndex + 2
        rightIndex = rightIndex + 2
        setPages()
    end 

end)
--opens recipeBook
open.MouseClick:Connect(function()
    recipeBook.Enabled = true
end)
--closes recipeBook
close.MouseButton1Click:Connect(function()
    recipeBook.Enabled = false
end)

-- sets pages initially
setPages()