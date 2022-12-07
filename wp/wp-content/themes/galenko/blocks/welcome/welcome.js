'use strict';
const roles = [
  'WordPress developer',
  'Full-stack developer',
  'Problem solver',
  'Web Consultant'
];
const animateOutClasses = [
    'fade-out', 
    'slide-out-fwd', 
    'slide-out-bck', 
    'slap-out', 
    'slap-out-back'
  ];

const stage = document.querySelector(".role-stage");


setInterval(() => {
  stage.classList.remove("fade-in");
  const randomClass = animateOutClasses[Math.floor(Math.random() * animateOutClasses.length)];
  stage.classList.add(randomClass);
  setTimeout(() => {
    const activeRoleId = parseInt(stage.getAttribute("data-current"));
    const tmpRoles = roles.filter((role, index) => index !== activeRoleId);
    const newRole = tmpRoles[Math.floor(Math.random() * tmpRoles.length)];
    const newRoleId = roles.indexOf(newRole);
    stage.setAttribute("data-current", newRoleId);
    stage.innerHTML = newRole;
    
    stage.classList.remove(randomClass);
    stage.classList.add("fade-in");
  }, 600);

}, 4000);