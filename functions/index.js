const functions = require('firebase-functions');
const sgMail = require('@sendgrid/mail');

// Set your SendGrid API key
sgMail.setApiKey('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');

exports.sendEmail = functions.https.onRequest(async (req, res) => {
    try {
        const { to, subject, text } = req.body;

        const msg = {
            to,
            from: 'docs@luigui.com', // Change to your verified sender
            subject,
            text,
            html: `<strong>${text}</strong>`,
        };

        await sgMail.send(msg);
        res.status(200).send('Email sent');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error sending email');
    }
});
