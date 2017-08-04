Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to:cc;
 bh=9vcM4Xv/l2nxMXNwR3gkPVm08Flo7TjkXIWJH8ueBtM=;
 b=ZuAjJK5/MZJRsfkV1JUbnrnWdX8VxooMKH7CdbInSXZTh4djh3uNYON/1OhCUIdbCt
 /TCkBq1+rNsSqgti5u7sYDArfSbkeMqDmMiHTLkpzwKpssRaApLcY3PQTEKO6hid373/
 L2hFvkrOW4fIqazqwcyLij0k0fu1OO5k9kfDnk/Ad5M/L7Qqe41WjuboRTT4fr3y6YP8
 bw2GJiOdFwvfAR0g5OmlaQVtnZW/1GJg+I+RndgmbP/Qrf/bmAwRl7Xa+PqaJF6EORrL
 LCM7ikm5Uk4fESuTLcZXe4Cy7oo43OQpb7KE2+d02t/DnHBB/gVLQWIY/v99F4KYP2ge
 ug8Q==
MIME-Version: 1.0
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 4 Aug 2017 22:52:27 +0800
Message-ID: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
Subject: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi,
I am sure the subject explain my intention. I got two processes trying
to modifying the same place. I want them to do it one after one, or,
if their operations interleave, I would like to let them know that the
content have been changed and polluted by the other so that the
content should be given up. That is, I would rather give up the data,
if polluted, than having a false one.

I try to set a atomic ref counter, but it seems impossible to do that
without a lock to synchronize.

Note that I don't want a strict synchronization: the situation is a
lot better. The data can be given up if that place has been polluted.

Yubin

