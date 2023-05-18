document.addEventListener('DOMContentLoaded', function() {
    const userForm = document.getElementById('userForm');
    const userList = document.getElementById('userList');
  
    
    userForm.addEventListener('submit', function(event) {
      event.preventDefault(); 
  
      fetch('https://dummyapi.io/data/v1/user?limit=10&page=1', {
        method: 'GET',
        headers: {
          'app-id': '6346ecdc44ffd6a5fcfa071c'
        }
      })
      .then(response => response.json())
      .then(data => {
        userList.innerHTML = '';
  
        data.data.forEach(user => {
          const userElement = document.createElement('div');
          userElement.innerHTML = `<strong>${user.firstName} ${user.lastName}</strong>`;
  
          userList.appendChild(userElement);
        });
      });
    });
  });
  