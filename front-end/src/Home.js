import { Sidebar } from "./components/Sidebar";
import { Node } from "./components/Node";
import { useState } from 'react';
import goal from "./goal/goal.json";

export const Home = () => {
  const [selectedGoalKey,setSelectedGoalKey] = useState(Object.keys(goal)[0]);
  // Sidebarから受け取ったkeyを処理するコールバック関数
  const handleSidebarGoalClick = (key) => {
    setSelectedGoalKey(Object.keys(goal)[key]);
  };
  return (
    <div className="Home">
      <div className="Slidebar">
        <Sidebar selectedGoalKey={selectedGoalKey} onGoalClick={handleSidebarGoalClick}/>
      </div>
      <div className="ProcessScreen">
        <div className="NodePlace">
          {
            console.log(goal[selectedGoalKey].Process)
          }
          <div className="Node1"><Node processText={'1:'+goal[selectedGoalKey].Process.Process1}/></div>
          <div className="Node2"><Node processText={'2:'+goal[selectedGoalKey].Process.Process2}/></div>
          <div className="Node3"><Node processText={'3:'+goal[selectedGoalKey].Process.Process3}/></div>
          <div className="Node4"><Node processText={'4:'+goal[selectedGoalKey].Process.Process4}/></div>
          <div className="Node5"><Node processText={'5:'+goal[selectedGoalKey].Process.Process5}/></div>
        </div>        
      </div>
    </div>
  );
};
