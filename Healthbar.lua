local color1 = Color(20, 20, 20, 200);
local color2 = Color(184, 48, 48, 255);
local height = 50;
local widht = 300;
local health_player=nil;
local sn = 100; 


function Healthbar_draw()
    if(LocalPlayer():Alive()) then
        health_player=LocalPlayer():Health(); --получаем здоровье игрока

        --Рисуем задник
        surface.SetDrawColor(color1); --Устанавливаем цвет для полоски
        surface.DrawRect(0, ScrH()-height, widht, height); --Рисуем задник для бара

        --Рисуем полоску HP
        surface.SetDrawColor(color2); --Устанавливаем цвет для задника
        surface.DrawRect(5, ScrH()+5-height, widht/100*health_player-10, height-10); --Рисуем полосу здоровья
    end
end



local hide = {
	["CHudHealth"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )



hook.Add("HUDPaint","Healthbar", Healthbar_draw);
