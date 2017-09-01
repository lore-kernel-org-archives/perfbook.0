Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=EgqQDfeIan3wDe6OKCKOmvjz86zF/995xxAfSX0W0zA=;
 b=MC/NbGKVCxlkD1+90ycMDpXpwChYYvO5cKOrL7SrLEi82OXtjOWhO8vVzipZX/Vjv9
 XkwJuatLKVIQv+fb1iZOxMKU0IQ03OIXV5jJS5yEgrsdRSM+dGX6EvefHTbAnwK7FVPx
 vFnJDjpvsl1czWGl2luKgMGzAzZ7+ckgjuL8pOW0OV+k/0ZlsxuWSI6AfJ64Izn6QgYq
 Sctjh9O21e9L3pTipdtNwSZqkc8e0SGC5C2bR+LVIVLN/yvdZ2+OCXvOmx49LcYOIWRN
 xG+OotKBTrqucaBy/f7h60Rs3Bw3awf8/blxwPya7YAvysOndAvWptNQcKILC/lkvQ9o
 ZfkA==
In-Reply-To: <20170831221008.GJ4431@linux.vnet.ibm.com>
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
 <20170804195049.GF3730@linux.vnet.ibm.com>
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
 <20170807165718.GW3730@linux.vnet.ibm.com>
 <CAJYFCiN4yhX7gvcag76RNizQ4T62vnR+b=09s262pW3jBuX2dg@mail.gmail.com>
 <CAJYFCiOzh7PHotQqNUt0oK+2BDgN9ujMQMQOtak35iontCfMPg@mail.gmail.com>
 <20170831221008.GJ4431@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 1 Sep 2017 09:53:44 +0800
Message-ID: 
 <CAJYFCiPaEDxDETT9VrHFpbbG6TTdzdWY2aUoLpERqg4AM+E2Bw@mail.gmail.com>
Subject: Re: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

2017-09-01 6:10 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Thu, Aug 24, 2017 at 02:30:41AM +0800, Yubin Ruan wrote:
>> Hi paul,
>>
>> 2017-08-08 10:12 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>> > 2017-08-08 0:57 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com=
>:
>> >> On Tue, Aug 08, 2017 at 12:48:08AM +0800, Yubin Ruan wrote:
>> >>> 2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>> >>> > 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm=
.com>:
>> >>> >> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
>> >>> >>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>> >>> >>> > Hi,
>> >>> >>> > I am sure the subject explain my intention. I got two processe=
s trying
>> >>> >>> > to modifying the same place. I want them to do it one after on=
e, or,
>> >>> >>> > if their operations interleave, I would like to let them know =
that the
>> >>> >>> > content have been changed and polluted by the other so that the
>> >>> >>> > content should be given up. That is, I would rather give up th=
e data,
>> >>> >>> > if polluted, than having a false one.
>> >>> >>> >
>> >>> >>> > I try to set a atomic ref counter, but it seems impossible to =
do that
>> >>> >>> > without a lock to synchronize.
>> >>> >>> >
>> >>> >>> > Note that I don't want a strict synchronization: the situation=
 is a
>> >>> >>> > lot better. The data can be given up if that place has been po=
lluted.
>> >>> >>>
>> >>> >>> Let's explain some of my reasoning: if process A use some flag to
>> >>> >>> indicate that it has entered the critical region, then if it cra=
sh
>> >>> >>> before it can reset the flag, all following processes cannot ent=
er
>> >>> >>> that region. But if process A cannot use flag for indication, ho=
w to
>> >>> >>> other people know (how to synchronization)?
>> >>> >>
>> >>> >> The simplest approach is to guard the data with a lock.
>> >>> >
>> >>> > Indeed. But if a process get killed then it will have no chance to=
 release
>> >>> > the lock...
>> >>> >
>> >>> > By the way, do you know whether there are any chances that a threa=
d get
>> >>> > killed by another thread when doing some "small" things? I mean so=
mething
>> >>> > like this:
>> >>> >
>> >>> >     lock();
>> >>> >     some_mem_copying();
>> >>> >     unlock();
>> >>> >
>> >>> > Are there any chance that a thread get killed by another thread be=
fore it
>> >>> > can "unlock()", without the entire process going down?
>> >>
>> >> Indeed, that is possible.  The pthread_kill() system call if nothing
>> >> else.
>> >>
>> >>> pthread_mutexattr_setrobust(..) will help in this situation, althoug=
h it is
>> >>> quite painful that nobody is maintaining the NPTL docs currently and=
 you have
>> >>> to dive into the source code if you want to make sure the semantic i=
s exactly
>> >>> what you want.
>> >>
>> >> True on all counts.  But what exactly are you trying to achieve?
>> >
>> > What I am going to achieve is to allow multiple producer to place some=
 content
>> > in some slots of a queue. The risk is that some producers might be in =
the same
>> > slot, so that it require some locking to synchronize them. But if you =
use lock,
>> > a thread holding the lock can get killed accidentally (for whatever re=
asons)
>> > before releasing it, causing all the other producers unable to acquire=
 it
>> > therefore.
>>
>> I got a really great idea for this kind of task. I want to share it with=
 you:
>>
>> The case:
>> I got a piece of memory(several Kb), and multiple producers try to put c=
ontent
>> into that area. A (single) consumer would try to read the content. So th=
ere
>> are two kind of synchronization: synchronization between producers and
>> synchronization between consumer and producers.(Note that there is only =
one
>> consumer, while a lots of producers)
>>
>> I don't want that single consumer to read intermediate data or dirty dat=
a so
>> that I need some synchronization mechanism to guarantee that consumer re=
ad
>> after a producer have finished putting content into that place. Also, I =
don't
>> want multiple producers to write to that place at the same time, since t=
hat
>> will result in dirty data.
>>
>> Clearly we do not need any lock between consumer and producer, a single =
flag
>> would suffice. But for synchronization between producers, we need lock. =
The
>> algorithm can be represented as follow:
>>
>>     //consumer
>>     if (flag =3D=3D DATA_IS_CLEAN) {
>>         consumer_read_data();
>>         flag =3D DATA_READED; // set it back so that producer can put
>> content there after
>>     } else {
>>         spin_or_return();
>>     }
>>
>>     // for every producer
>>     if (flag =3D=3D DATA_READED) { // consumer have finished reading
>>         if (try_lock()) {
>>             put_content();
>>             unlock();
>>         } else {
>>             return;
>>         }
>>     } else {
>>         return;
>>     }
>>
>> so now we have the needed synchronization.
>>
>> But the problem is, a producer can simple die after it does
>> `put_content()` and before
>> `unlock()`. That is awkward, since that effectively means deadlock for
>> that memory area.
>>
>> To rescue, we can use a robust lock from pthread, which guarantees
>> that if the lock
>> holder dies, the next one who tries to acquire the lock will succeed.
>> (see pthread_mutexattr_setrobust(3))
>>
>> Pthread's robust lock is great, and is very fast. However, I still
>> consider it a litte
>> bit heavy and I want to craft my own. I want to make it lock free,
>> with some atomic
>> instruction. So I come up with a idea: I can use a atomic `xadd'
>> instruction for that.
>> I can implement my own `try_lock()' like this:
>>
>>     int try_lock() {
>>         uint8_t previous_value =3D xadd(&lock, 1);
>>         return previous_value =3D=3D 0;
>>     }
>>
>> Clearly when *lock =3D=3D 0, some process can xadd it to 1 and
>> successfully acquire the lock.
>> A correspondingly simple `unlock()' would be:
>>
>>     int unlock() {
>>         *lock =3D 0;
>>     }
>>
>> Now how do we deal with the deadlock problem? Use wrap around. Because
>> every process who
>> tries to acquire the lock will xadd 1 to the lock, until some time it
>> wrap around and we
>> now reach 0 again, which will atomically unlock the lock!! Therefore,
>> if the lock owner
>> dies, the lock will be unlocked some time.
>>
>> You may ask, what if the lock get wrapped around "too fast" such that
>> two process hold the
>> lock at the same time? The answer is, make the lock of some bigger
>> type, probably uint32_t,
>> in which case you have to have 2^32 processes on a system (at the same
>> time) to complete
>> for that lock, in such a short time(as we are some quick thing inside
>> the critical region).
>> That would make the race impossible. In my case, because I have a long
>> queue, and it takes
>> many processes to occupy a queue to reach the original one, a uint8_t
>> will suffice.
>>
>> (I am designing some lock-free multi-producers single-consumer message
>> queue. The design is
>> pretty nice. I will send more later ;-)
>
> This has been a very popular activity over the past few decades.
> Here are a few places you can look to see other work in this area:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__libcds.sourceforge.=
net_&d=3DDwIBaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZ=
c70Kq4AkfdiRGMI&m=3D5x3ObHafo0KNuT7M-Nkjq4LD6KFAr5EwwkeHlpv4r0g&s=3DD8_MMzO=
5277aG3Cu6FmWhYes5OB3JbjjA8BWk8BJtuQ&e=3D=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__liburcu.org&d=3DDwI=
BaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiR=
GMI&m=3D5x3ObHafo0KNuT7M-Nkjq4LD6KFAr5EwwkeHlpv4r0g&s=3D25r25v_Mn6kq6Nxq59F=
7uGnlt5O1o89Eq-xNB20on2E&e=3D=20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_concurr=
encykit_ck&d=3DDwIBaQ&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLb=
UmPebZc70Kq4AkfdiRGMI&m=3D5x3ObHafo0KNuT7M-Nkjq4LD6KFAr5EwwkeHlpv4r0g&s=3DM=
4G2r8MNw5Pus-eg12ESnhmL8kH3ZLEMH8IGIlCP9DY&e=3D=20
>
> There are quite a few others.
>
> The difficulty with breaking locks is that the state space is quite
> large, and can vary based on things like compiler optimizations.
> Don't get me wrong, people really do things like this, but it is
> not easy.

Thanks, paul.

Yubin

