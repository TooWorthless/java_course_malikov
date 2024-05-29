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


function editEvent(eventId) {
    const event_form = document.getElementById(`event_${eventId}_form`);
    console.log('eventId :>> ', eventId);
    const event_form_elems = document.getElementsByClassName(`event_${eventId}_elem`);
    for(const form_elem of event_form_elems) {
        form_elem.style.display = "none";
    }

    const event_form_inputs = document.getElementsByClassName(`event_input_${eventId}`);
    for(const input of event_form_inputs) {
        input.style.display = "block";
    }

    const btns = {
        edit_btn: document.getElementById(`edit_event_${eventId}_btn`),
        update_btn: document.getElementById(`update_event_${eventId}_btn`),
        cancel_btn: document.getElementById(`cancel_update_event_${eventId}_btn`),
        delete_btn: document.getElementById(`delete_event_${eventId}_btn`)
    }

    btns.edit_btn.style.display = "none";
    btns.delete_btn.style.display = "none";
    btns.update_btn.style.display = "inline";
    btns.cancel_btn.style.display = "inline";
}

function cancelUpdate(eventId) {
    const event_form = document.getElementById(`event_${eventId}_form`);
    const event_form_elems = document.getElementsByClassName(`event_${eventId}_elem`);
    for(const form_elem of event_form_elems) {
        form_elem.style.display = "block";
    }

    const event_form_inputs = document.getElementsByClassName(`event_input_${eventId}`);
    for(const input of event_form_inputs) {
        input.style.display = "none";
    }

    const btns = {
        edit_btn: document.getElementById(`edit_event_${eventId}_btn`),
        update_btn: document.getElementById(`update_event_${eventId}_btn`),
        cancel_btn: document.getElementById(`cancel_update_event_${eventId}_btn`),
        delete_btn: document.getElementById(`delete_event_${eventId}_btn`)
    }

    btns.edit_btn.style.display = "inline";
    btns.delete_btn.style.display = "inline";
    btns.update_btn.style.display = "none";
    btns.cancel_btn.style.display = "none";
}


async function deleteEvent(eventId) {
    const createEventResponse = await fetch(window.location.origin + '/events/delete/' + eventId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', 
            'Authorization': 'Bearer '+token
        },
        body: JSON.stringify({})
    });

    if(createEventResponse.status == 200) {
        alert('The event was deleted successfully');
        location.href='/admin/events';
    }
}


async function updateEvent(eventId) {
    const inputs = document.getElementsByClassName("event_input_"+eventId);
    const event = {
        "id": eventId
    }

    for (const input of inputs) {
        event[input.name] = input.value;
    }

    console.log('event :>> ', event);

    const createEventResponse = await fetch(window.location.origin + '/events/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + token
        },
        body: JSON.stringify(event)
    });

    if (createEventResponse.status == 200) {
        alert('The event was updated successfully');
        location.href = '/admin/events';
    }
}