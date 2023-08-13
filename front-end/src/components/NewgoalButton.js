import React from "react";

export function NewgoalButton() {
  return (
    <div>
        <div onClick={()=>{console.log('pushed NewgoalButton!!')}} class="buttonRound">+ New goal</div>
    </div>
  );
};

export default NewgoalButton;
