export const ADD_EXPLANATION = 'ADD_EXPLANATION';
export const SET_EXPLANATIONS = 'SET_EXPLANATIONS';
export const SET_DEMAND = 'SET_DEMAND';
export const SET_CURRENT_USER = 'SET_CURRENT_USER';

export function setExplanations(explanations) {
  console.log("ЗАПУСКАЕТСЯ СЕТ ЭКСПЛАНАТИОНС");
  return {
    type: SET_EXPLANATIONS,
    explanations: explanations
  };
}

export function addExplanation(explanation) {
  return {
    type: ADD_EXPLANATION,
    explanation: explanation
  };
}

export function SetCurrentUser(current_user) {
  return {
    type: SET_CURRENT_USER,
    current_user: current_user
  };
}


export function SetDemand(demand) {
  return {
    type: SET_DEMAND,
    demand: demand
  };
}
