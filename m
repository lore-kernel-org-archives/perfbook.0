Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R0Wews/lrW5F/cXeRadXVcb4RqmPTetEi7BmcTLgk4E=;
 b=H1MPmlbbKpetYPwtmOsRGZP6n9oliegRSIiuBPRdUZSBsrxhxBXYm5JpRcp1INHgmR
 n6XWm3zAHg5pEmrM28E2TNj4dieV5kqpTMPao5kESCxOqBuDPkIoqkspvCbW2uTxclFX
 41VFjYuqC9uep0skKl8Pp+CDpCcqj2M75aKbl2s/r5hlsMbbE/PA0bK4x4GPY8Op0l/+
 EA1zKRMqVgWQ0Wn9mjmQVXrj0oXlPh/lqNkxraWE/hkiCB8ssds+rbnwX33QKqrvqRYI
 B69UmiSkLn+YeekWBuLX2IOjFsrgfDhqHi/FQQ+R+ELgtfU8g/X6eZwgWoTdG/VLErx+
 5+yw==
MIME-Version: 1.0
In-Reply-To: 
 <CAJYFCiN4yhX7gvcag76RNizQ4T62vnR+b=09s262pW3jBuX2dg@mail.gmail.com>
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
 <20170804195049.GF3730@linux.vnet.ibm.com>
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
 <20170807165718.GW3730@linux.vnet.ibm.com>
 <CAJYFCiN4yhX7gvcag76RNizQ4T62vnR+b=09s262pW3jBuX2dg@mail.gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 8 Aug 2017 17:42:22 +0800
Message-ID: 
 <CABoNC80+9musynkxo8o6gmDLxr57Qxne_Xfn6HFVthuYVdK+1g@mail.gmail.com>
Subject: Re: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

HI Yubin,

Please see below,

On Tue, Aug 8, 2017 at 10:12 AM, Yubin Ruan <ablacktshirt@gmail.com> wrote:
> 2017-08-08 0:57 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> On Tue, Aug 08, 2017 at 12:48:08AM +0800, Yubin Ruan wrote:
>>> 2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>>> > 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.co=
m>:
>>> >> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
>>> >>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>>> >>> > Hi,
>>> >>> > I am sure the subject explain my intention. I got two processes t=
rying
>>> >>> > to modifying the same place. I want them to do it one after one, =
or,
>>> >>> > if their operations interleave, I would like to let them know tha=
t the
>>> >>> > content have been changed and polluted by the other so that the
>>> >>> > content should be given up. That is, I would rather give up the d=
ata,
>>> >>> > if polluted, than having a false one.
>>> >>> >
>>> >>> > I try to set a atomic ref counter, but it seems impossible to do =
that
>>> >>> > without a lock to synchronize.
>>> >>> >
>>> >>> > Note that I don't want a strict synchronization: the situation is=
 a
>>> >>> > lot better. The data can be given up if that place has been pollu=
ted.
>>> >>>
>>> >>> Let's explain some of my reasoning: if process A use some flag to
>>> >>> indicate that it has entered the critical region, then if it crash
>>> >>> before it can reset the flag, all following processes cannot enter
>>> >>> that region. But if process A cannot use flag for indication, how t=
o
>>> >>> other people know (how to synchronization)?
>>> >>
>>> >> The simplest approach is to guard the data with a lock.
>>> >
>>> > Indeed. But if a process get killed then it will have no chance to re=
lease
>>> > the lock...
>>> >
>>> > By the way, do you know whether there are any chances that a thread g=
et
>>> > killed by another thread when doing some "small" things? I mean somet=
hing
>>> > like this:
>>> >
>>> >     lock();
>>> >     some_mem_copying();
>>> >     unlock();
>>> >
>>> > Are there any chance that a thread get killed by another thread befor=
e it
>>> > can "unlock()", without the entire process going down?
>>
>> Indeed, that is possible.  The pthread_kill() system call if nothing
>> else.
>>
>>> pthread_mutexattr_setrobust(..) will help in this situation, although i=
t is
>>> quite painful that nobody is maintaining the NPTL docs currently and yo=
u have
>>> to dive into the source code if you want to make sure the semantic is e=
xactly
>>> what you want.
>>
>> True on all counts.  But what exactly are you trying to achieve?
>
> What I am going to achieve is to allow multiple producer to place some co=
ntent
> in some slots of a queue. The risk is that some producers might be in the=
 same
> slot, so that it require some locking to synchronize them. But if you use=
 lock,

It seems what you are looking for is a lock-free queue implementation,
which, by placing difference write requests on different queue slots,
immunes to the risk you mentioned. There are plenty of them. One
example (From "Fast concurrent queues for x86 processors", 2013):

enqueue(x : Object) {
    while (true) {
        t :=3D F&A(&tail, 1)
        if ( SWAP(&Q[t], x) =3D=E2=8A=A5 ) return OK
    } }
dequeue() {
    while (true) {
    h :=3D F&A(&head, 1)
    x :=3D SWAP(&Q[h], ?)
    if x !=3D=E2=8A=A5 return x
    if ( tail =E2=89=A4 h+1) return EMPTY
} }

But as mentioned by Paul, "Doing "just a bit more" in this area
usually means incurring a huge amount more pain", the code snippet
above may suffer livelock problem. If you care about that, the authors
have addressed the problem and the code is free to download.

--Jason

> a thread holding the lock can get killed accidentally (for whatever reaso=
ns)
> before releasing it, causing all the other producers unable to acquire it
> therefore.
>
> Ideas of RCU can help here, except that I have a statically allocated
> array-based queue, where every slot is addressed by index rather than poi=
nter,
> and because we can not dynamically allocate any space (malloc() not allow=
ed),
> our choices are limited.
>
>> Note that killing a thread not holding any lock can be a problem, for
>> example, suppose the thread that is to place a new element gets killed
>> just before doing so.  How do you intend to handle that situation?
>>
>>> Yubin
>>>
>>> >> But if you don't want to do that, another approach is to restrict th=
e
>>> >> data to one machine word minus one bit, with zero saying that the lo=
cation
>>> >> is (as you say) unpolluted.  Then you can use a compare-and-swap loo=
p
>>> >> to update the location only if it is unpolluted.
>>> >>
>>> >> But maybe you need more data.  If so, you can have the data separate=
ly
>>> >> (perhaps dynamically allocated, perhaps not, your choice), and then =
use
>>> >> the compare-and-swap method above where NULL says unpolluted.
>>> >
>>> > Good suggestion... although I think it would be pretty painful.
>>
>> Well, if you are going for full-up fault tolerance, you are in for a
>> world of pain regardless.  Fault tolerance is non-trivial any way you
>> look at it.
>>
>> Therefore, my advice is to very carefully work out what your users reall=
y
>> need, and implement exactly that.  Doing "just a bit more" in this area
>> usually means incurring a huge amount more pain, often incurred later
>> in the project.
>
> Yes I agree. Designing a lock-free algorithm is full of fun, but neverthe=
less
> lock-free comes with price.
>
> Thanks,
> Yubin
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

