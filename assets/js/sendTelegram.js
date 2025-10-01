// assets/js/sendTelegram.js
async function enviarMensaje(mensaje, teclado) {
  try {
    const resp = await fetch('http://localhost:3000/send-message', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key-authorization': 'CLAVE_FRONTEND_OPCIONAL'
      },
      body: JSON.stringify({ mensaje, teclado })
    });
    return await resp.json();
  } catch (err) {
    console.error('Error enviando mensaje:', err);
    return { ok: false, error: err };
  }
}
