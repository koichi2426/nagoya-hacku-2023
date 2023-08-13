import React from "react";

export function Node(props) {
  return (
    
    <div className="Node" onClick={()=>{console.log('push!!')}}>
        <div className="NodeText">
          {props.processText}
        </div>
    </div>
  );
}

export default Node;
