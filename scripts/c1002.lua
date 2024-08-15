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
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_TO_GRAVE)
	e2:SetCountLimit(1,id)
	e2:SetOperation(s.fgop)
	c:RegisterEffect(e2)
end
s.listed_names={id}
function s.fgop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) or c:IsImmuneToEffect(e) or not c:IsLocation(LOCATION_GRAVE) then return end
	if not Duel.MoveToField(c,tp,tp,LOCATION_SZONE,POS_FACEUP,true) then return end
	local e2=Effect.CreateEffect(c)
	e2:SetCode(EFFECT_CHANGE_TYPE)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD-RESET_TURN_SET)
	e2:SetValue(TYPE_SPELL+TYPE_CONTINUOUS)
	c:RegisterEffect(e2)
	c:RegisterFlagEffect(id,RESET_EVENT+RESETS_STANDARD-RESET_TURN_SET,0,1)
end
