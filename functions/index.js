const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');
const cors = require('cors')({ origin: true });
admin.initializeApp();

/**
 * Here we're using iCloud to send emails
 */
let transporter = nodemailer.createTransport({
    host: 'smtp.mail.me.com',
    port: 587,
    secure: false,
    auth: {
        user: 'juanfrancistm2011@icloud.com',
        pass: 'aflx-qhzc-adoo-ceov',
    },
});

exports.sendMail = functions.https.onRequest((req, res) => {
    cors(req, res, () => {
        // getting destination email from query string
        const dest = req.query.dest;
        const name = req.query.name;
        const email = req.query.email;
        const phone = req.query.phone;
        const address = req.query.address;
        const condition = req.query.condition;
        const type = req.query.type;
        const serviceType = req.query.serviceType;
        const apiPrices = req.query.apiPrices;
        const averageApiPrice = req.query.averageApiPrice;
        const costumerPrice = req.query.costumerPrice;
        const sendAgent = req.query.sendAgent;
        const services = req.query.services;

        const mailOptions = {
            from: 'RemaxGeeks <juanfrancistm2011@icloud.com>',
            to: dest,
            subject: "NEW COSTUMER!!!",
            html: `
            <p style="font-size: 16px;">Hi, you have a new costumer, please check the details below:</p>
            <br />
            <p style="font-size: 16px;">NAME: ${name}</p>
            <p style="font-size: 16px;">PHONE: ${phone}</p>
            <p style="font-size: 16px;">EMAIL: ${email}</p>
            <br />
            <p style="font-size: 16px;">ADDRESS: ${address}</p>
            <p style="font-size: 16px;">PROPERTY CONDITION: ${condition}</p>
            <p style="font-size: 16px;">PROPERTY TYPE: ${type}</p>
            <p style="font-size: 16px;">SERVICE TYPE: ${serviceType}</p>
            <p style="font-size: 16px;">API PRICES: ${apiPrices}</p>
            <p style="font-size: 16px;">AVERAGE API PRICE: ${averageApiPrice}</p>
            <p style="font-size: 16px;">COSTUMER PRICE: ${costumerPrice}</p>
            <p style="font-size: 16px;">SEND AGENT: ${sendAgent}</p>
            <p style="font-size: 16px;">SERVICES: ${services}</p>
            <br />
            
           
       
            
        `,
        };

        // returning result
        return transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                return res.send(error.toString());
            }
            return res.send('Sent');
        });
    });
});