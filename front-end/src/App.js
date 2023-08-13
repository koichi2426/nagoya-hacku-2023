import { BrowserRouter, Routes, Route } from "react-router-dom";
import { Home } from "./Home";
import { Page1 } from "./Page1";
import { Page2 } from "./Page2";
import './App.CSS';
import React ,{ useState } from 'react';
import App from './App.jsx';

export default function App() {
  // Home画面に遷移する関数
  function goHome() {
    window.location.href = './'
  }

  //目標達成プロセス画面に遷移する関数
  function goPage1() {
    window.location.href = './Page1'
  }

  //目標達成プロセス生成中画面に遷移する関数
  function goPage2() {
    window.location.href = './Page2'
  }

  return (
    <div>
      <BrowserRouter>
      {/* パスとコンポーネントの対応付けをする部分 */}
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/Page1" element={<Page1 />} />
        <Route path="/Page2" element={<Page2 />} />
      </Routes>
      </BrowserRouter>
    </div>
  );
}
