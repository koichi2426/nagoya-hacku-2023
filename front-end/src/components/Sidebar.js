import React from "react";
import {NewgoalButton} from "./NewgoalButton";
import SidebarIcon from "./SidebarIcon";
import goal from "../goal/goal.json";
import FlagIcon from '@mui/icons-material/Flag';



export function Sidebar(props) {
  const selectedGoalKey = props.selectedGoalKey;
  // コールバック関数を定義
  const handleGoalClick = (key) => {
    // Homeコンポーネントに選択されたkeyを渡す
    props.onGoalClick(key);
  };

  console.log('Sidebar:'+selectedGoalKey);
  return (
    <div className="Sidebar">
      <SidebarIcon />
      <div className="NewgoalButton">
        <NewgoalButton/>
      </div>
      <ul className="SidebarList">
        {Object.keys(goal).map((goalkey, key) => {
          const {title} = goal[goalkey];
          return (
            <li
              key={key}
              className="row"
              onClick={() => {
                console.log('Pushed goal'+key+'!!');
                // コールバック関数を呼び出して選択されたkeyを渡す
                handleGoalClick(key);
              }}
            >
              <div id="icon"><FlagIcon/></div>
              <div id="title">{title}</div>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

export default Sidebar;
