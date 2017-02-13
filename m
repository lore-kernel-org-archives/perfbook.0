Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:33140 "EHLO
 mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752134AbdBMNLt (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 08:11:49 -0500
Received: by mail-ot0-f194.google.com with SMTP id f9so11236954otd.0 for
 <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 05:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=cd52u5KCqD9X5gQ9hOwbe7NW5IZ4ALrsq6NHlO8Ida0=;
 b=inPrsknwEW7bQOdxO5mdWi6OeYWakem/xPqjcZxRfxmqqNH+x3Bdta55bGoBpykpEQ
 b8BRGULy/OHe2Q6cgZHUqxs0/Pg165OWEqlNCrOlBTYLvDQUIzOI5YswlJ0HDNv50BW6
 FYuIYcM9gXrow5tA03XbL9QjjjqA5q5vpcbDRHkwHdla13Edh4cqpE1wAcUJSTVsAh8k
 P6t+bctppJxFZlOcc5QV9KOicOhqK1IkUZz4KLe/COtRfUG64R013VemWmcIqBKfN69a
 gTpD/iIbDU38jyz8HsrQTbABSjijwBcQX82jwN91trAF5arIE/kXEVcX1OS73vCVCJFh
 iCHw==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id o66sm14797656pfa.119.2017.02.13.05.11.36 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Mon, 13 Feb
 2017 05:11:37 -0800 (PST)
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: function smp_read_barrier_depends() confuses me
Message-ID: <381e5a1a-6550-fedb-5d04-cf6d8fe3fe3b@gmail.com>
Date: Mon, 13 Feb 2017 21:11:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

I have just finished Appendix B of perfbook(2017.01.02a), but the 
function smp_read_barrier_depends() and how it make the code below 
correct really confused me.

In B.7, paragraph 2, it say:

(1)  "Yes, this does mean that Alpha can in effect fetch the data 
pointed to before it fetches the pointer itself,..."

and after presenting the code example:

1  struct el *insert(long key, long data)
2  {
3     struct el *p;
4     p = kmalloc(sizeof(*p), GFP_ATOMIC);
5     spin_lock(&mutex);
6     p->next = head.next;
7     p->key = key;
8     p->data = data;
9     smp_wmb();
10    head.next = p;
11    spin_unlock(&mutex);
12 }
13
14 struct el *search(long key)
15 {
16    struct el *p;
17    p = head.next;
18    while (p != &head) {
19        /* BUG ON ALPHA!!! */
20        if (p->key == key) {
21            return (p);
22        }
23        p = p->next;
24    };
25    return (NULL);
26 }

it says:

(2) "On Alpha, the smp_wmb() will guarantee that the cache invalidates 
performed by lines 6-8 will reach the interconnect before that of line 
10 does, but make absolutely no guarantee about the order in which the 
new values will reach the reading CPU's core"

My question is, how exactly does this code break on Alpha and how the 
smp_read_barrier_depends() help make it correct, as follow:

18    while (p != &head) {
19        smp_read_barrier_depends();
20        if (p->key == key) {
21            return (p);

According to (2), I guess that the code breaks because the "new values" 
arrive in reading CPU in disorder, even though "cache invalidation 
messages" arrive in order. That says, in Figure B.10, even though the 
reading CPU core get invalidation message of
    p->next
    p->key
    p->data
before invalidation message of `head.next', it might not get the value of
    p->next
    p->key
    p->data
before `head.next', which resulting in code break. Is that correct ?
The whole paragraphs do not refer to any exact line of code so I really 
confusing.

And, if that is correct, can I infer that all other CPUs except Alpha 
would guarantee that "new values" and "cache invalidation messages" 
would arrive in reading CPU in order, with proper memory barriers like 
that at line 9 ?

Frankly, I consider the some narratives in Appendix B pretty 
confusing(no offense):

1. At paragraph 4 in page 350 of the two-column perfbook.2017.01.02a, it 
says:

     "Figure B.10 shows how ... Assume that the list header `head' will 
be processed by cache bank 0, and that the new element will be processed 
by cache bank 1 ... For example, it is possible that reading CPU's cache 
bank 1 is very busy, but cache bank 0 is idle..."

   As there are bank 0 and bank 1 in both the writing CPU and the 
reading CPU, it is hard to infer which cache bank 0 is processing the 
header `head' and which cache bank 1 is processing the new element, and 
as a result I don't know how that disorder happen.

2. In figure B.10, both CPU have a "(r)mb Sequencing" and "(r)mb 
Sequencing", but not all of this are necessary. So, what do those 
sequencing mean ?

I have read the mail at
     http://h41379.www4.hpe.com/wizard/wiz_2637.html
but cannot find anything directly related to Alpha's weird feature. Can 
anyone provide any hint?(which paragraph...)

regards,
Yubin Ruan
