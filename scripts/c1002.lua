--Faye of the White Forest

local s, id = GetID()

function s.initial_effect(c)
    --Set itself into S/T zones as a spell
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_MONSTER_SSET)
	e1:SetValue(TYPE_SPELL)
	c:RegisterEffect(e1)
	--set open from GY
end
s.listed_names={id}
