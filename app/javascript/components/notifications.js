// const notifications = document.querySelector('[data-behavior="notifications"]');
// // const counter = document.querySelector('[data-behavior="notifications-counter"]');

// if (notifications) {
//  loadNotifications();
//  setInterval(() => {
//    loadNotifications();
//  }, 5000);
// }

// // if (counter) {
// //  counter.addEventListener('click', markAsRead)
// // }

// function loadNotifications() {
//     fetch('/notifications', {
//             method: 'get',
//             headers: {
//               'Content-Type': 'application/json',
//               'X-CSRF-Token': Rails.csrfToken()
//             },
//             credentials: 'same-origin'
//           })
//     .then(response => response.json())
//     .then(data => {
//       refreshCounter(data.array.length);
//       refreshNotifications(renderNotifications(data.array));
//     })
// };


  
// function renderNotifications(notifications) {
//   return notifications.map(notification => {
//     return(
//       `<li class="notification">
//       <strong>${notification.user}</strong>
//       ${notification.action}
//       ${notification.notifiable.type}
//       </li>
//       `
//     )
//   }).join('');
// };
// function refreshNotifications(notificationsHTML) {
//   const notifications = document.getElementById('notifications');
//   notifications.innerHTML = notificationsHTML;
// };  


// -------------------------------------------------------------------------------------------

import { setCallback } from '../client/notifications';

const notifications = document.getElementById('notifications');

if (notifications) {
  setCallback(({notification}) => {
    notifications.insertAdjacentHTML("afterbegin", notification);
  });
}