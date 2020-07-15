import { UserType } from './UserType';
import { getProfileRef, db } from './index';
import admin = require('firebase-admin');


export async function studentParentAutoEntry(eventSnapshot: any, context: any) {

    const schoolCode = context.params.schoolCode;
    const studentId = context.params.studentId;
    const country = context.params.country;
    //const batch = db.batch();

    // console.log(schoolCode);
    // console.log(studentId);

    const newValue = eventSnapshot.after!.data();
    const studentProfileRef = eventSnapshot.after.ref;
    // const newValue = eventSnapshot.data();
    // const studentProfileRef = eventSnapshot.ref;

    const standard = newValue!.standard;
    const division = newValue!.division;

    // console.log(newValue);

    
    const inJsonFormat = Object.assign(newValue, { id: newValue!.id });

    let map = {
        id: studentProfileRef,
        userId:studentId,    //trying to put/store an id to help in query of specific doc in chats
    }

    //var batch = db.batch();

    // console.log(inJsonFormat);

    
    const connections = inJsonFormat.connection !== null ? inJsonFormat.connection as Map<String, any> : null;

    
    if (connections !== null) {

        const connectionsArray = [];
        for (const connection in connections) {
            connectionsArray.push((connections as any)[connection]);
        }
        console.log(connectionsArray);
        console.log(connectionsArray.length);

        connectionsArray.map(async (value, index) => {
          
            const connectionProfileRef = await getProfileRef(schoolCode, country, UserType.PARENT, value);
            const key = (index + 1) + '';
            // parentMap.set(key, connectionProfileRef);
        
            const parentMap: { [key: string]: any } = {};
            parentMap[key] = connectionProfileRef;

            /* await db.collection('Schools').doc(country).collection(schoolCode).doc('Students')
            .collection(standard + division).doc(studentId).set(parentMap, { merge: true });   */

            map = Object.assign(map, parentMap);

            const connectionMap = {
                id: connectionProfileRef,
                userId:value,
            }
            return db.collection('Schools').doc(country)
            .collection(schoolCode).doc('Parents').collection(standard + division).doc(value)
            .set( connectionMap, { merge: true }); 
            // var ref1 = db.collection('Schools').doc(country)
            // .collection(schoolCode).doc('Parents').collection(standard + division).doc(value);
            // batch.set(ref1, connectionMap, { merge: true });
        });
    }

    // var ref2 = db.collection('Schools').doc(country)
    // .collection(schoolCode).doc('Students').collection(standard + division).doc(studentId);

    //batch.set(ref2, map, { merge: true });

    return await db.collection('Schools').doc(country)
    .collection(schoolCode).doc('Students').collection(standard + division).doc(studentId)
    .set( map, { merge: true });
}

export async function teacherAutoEntry(eventSnapshot: any, context: any) {

    const schoolCode = context.params.schoolCode;
    const teacherId = context.params.teacherId;
    const country = context.params.country;

    // console.log(schoolCode);
    // console.log(studentId);

    const newValue = eventSnapshot.after!.data();
    const teacherProfileRef = eventSnapshot.after.ref;

    const isTeacher = newValue!.isTeacher as boolean;

    if (isTeacher) {
        const standard = newValue!.standard;
        const division = newValue!.division;

        const map = {
            id: teacherProfileRef,
        }

        return await db.collection('Schools').doc(country).collection(schoolCode).doc('Teachers')
        .collection(standard + division).doc(teacherId).set(map, { merge: true });
    } else {
        return;
    }
}

export async function messageIdAutoEntry(eventSnapshot: any, context: any) {
    const schoolCode = context.params.schoolCode;
    // const messageId = context.params.messageId;
    const country = context.params.country;
    const chatId = context.params.chatId;
    const standard = context.params.standard;

    const map: { [key: string]: any } = {};

    const pathToChat = `/Schools/${country}/${schoolCode}/Chats/${standard}/Chat/${chatId}/`;

    const snapShotData = eventSnapshot!.data()

    const student = snapShotData!.for;
    const from = snapShotData!.from;
    const to = snapShotData!.to;

    map[student] = pathToChat;

    const batch2 = db.batch();

    const ref1 = db.collection(`/Schools/${country}/${schoolCode}/Chats/${standard}/Parent-Teacher/${from}/`)
    .doc(to);
    const ref2 = db.collection(`/Schools/${country}/${schoolCode}/Chats/${standard}/Parent-Teacher/${to}/`)
    .doc(from);

    batch2.set(ref1, map, { merge: true });
    batch2.set(ref2, map, { merge: true });
    console.log('chat link created');


    return await batch2.commit();
}




const notification_options = {
  priority: "high",
  timeToLive: 60 * 60 * 24
};


export async function notificationChat(eventSnapshot: any, context: any) {
    const fcm = admin.messaging();

    const newValue = eventSnapshot.data();
    const id = newValue.to;
    //const sms = newValue.message;
    const from = newValue.from;

    console.log('=========start of notification=======');
    console.log(newValue);

    const querySnapshot = await db
    .collection('users')
    .doc(id)
    .collection('tokens')
    .limit(3)
    .orderBy('createdAt', "desc")
    .get()

  const tokens = querySnapshot.docs.map(snap => snap.id);

  const options =  notification_options

  const payload: admin.messaging.MessagingPayload = {
    notification: {
      title: 'New Message!',
      body: `you have a new message from ${from}`,
      //icon: 'your-icon-url',
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
      sound: 'default',

    }
  };
  console.log('=========thee end of notification=======');
  return fcm.sendToDevice(tokens, payload,options);


}
export async function notificationFees(eventSnapshot: any, context: any) {
    const fcm = admin.messaging();

    const newValue = eventSnapshot.data();
    const id = newValue.to;
    //const sms = newValue.message;
   // const from = newValue.from;

    console.log('=========start of notification=======');
    console.log(newValue);

    const querySnapshot = await db
    .collection('users')
    .doc(id)
    .collection('tokens')
    .get();

  const tokens = querySnapshot.docs.map(snap => snap.id);
  const options =  notification_options

  const payload: admin.messaging.MessagingPayload = {
    notification: {
      title: 'Fees Updates',
      body: `Some Payments Changes`,
      //icon: 'your-icon-url',
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
      sound: 'default',
    }
  };
  console.log('=========thee end of notification=======');
  return fcm.sendToDevice(tokens, payload, options);


}