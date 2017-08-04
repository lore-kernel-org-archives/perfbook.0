Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=i2Kn7bRAJwg8cB4qQlui/K5WKEhVme0dj3fKjEbPqcg=;
 b=nmQUnAP3abTN1Jw1xWPd/rz5ii/mZAp7/6+VPGXiAXLdlERD45OoGSd+KoW4peEktV
 4OshCgb4q2lgWQojxIyCBbAW0gXU4KOQhyV0HS52+kI4sgDIMLd60G0tipOSWTA2nrSm
 wXnfIPOTg5BD6Ky8QwlIxv6Clrp9NrGDVsbuEK/kkZwCM/HbuhNJS06Fl1kvkr9wVF1o
 Zf6lSkIJgUcZ+YRBeUubAFADr0os506iizYxvZuaHnpq85FEmZYp257+xiIGHGMoVARL
 3tSN5giAc8p9BNF2MEUb61w1Wb3wNnJ/LjkiydJX8wDfUViNFWJ7i0vX6ihhZ4uYD05/
 euKg==
MIME-Version: 1.0
In-Reply-To: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 4 Aug 2017 23:57:28 +0800
Message-ID: 
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
Subject: Re: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> Hi,
> I am sure the subject explain my intention. I got two processes trying
> to modifying the same place. I want them to do it one after one, or,
> if their operations interleave, I would like to let them know that the
> content have been changed and polluted by the other so that the
> content should be given up. That is, I would rather give up the data,
> if polluted, than having a false one.
>
> I try to set a atomic ref counter, but it seems impossible to do that
> without a lock to synchronize.
>
> Note that I don't want a strict synchronization: the situation is a
> lot better. The data can be given up if that place has been polluted.

Let's explain some of my reasoning: if process A use some flag to
indicate that it has entered the critical region, then if it crash
before it can reset the flag, all following processes cannot enter
that region. But if process A cannot use flag for indication, how to
other people know (how to synchronization)?

Yubin

