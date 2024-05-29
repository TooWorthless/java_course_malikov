let token;

async function main() {
    const jwt = await fetch(window.location.origin + '/api/auth/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            "email": document.getElementById("email").value,
            "password": document.getElementById("password").value
        })
    });

    return jwt.json();
}

main()
    .then(res => {
        token = res.accessToken;
    })
    .catch(err => console.log('err.message :>> ', err.message));


async function submitForm() {
    const inputs = document.getElementsByClassName("event_form_input");
    const event = {}

    for (const input of inputs) {
        event[input.name] = input.value;
    }

    const createEventResponse = await fetch(window.location.origin + '/events/create', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        },
        body: JSON.stringify(event)
    });

    if (createEventResponse.status == 200) {
        alert('The event was added successfully');
        location.href = '/admin/events';
    }
}


function resetForm() {
    document.getElementById('createEventForm').reset();
}