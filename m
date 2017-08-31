Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59123 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751001AbdHaWKN (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 31
 Aug 2017 18:10:13 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7VM9TMZ021989
 for <perfbook@vger.kernel.org>; Thu, 31 Aug 2017 18:10:13 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cpkvhdm1g-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 31 Aug 2017 18:10:13 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 31 Aug
 2017 18:10:11 -0400
Date: Thu, 31 Aug 2017 15:10:09 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronization between two process without lock
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
 <20170804195049.GF3730@linux.vnet.ibm.com>
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
 <20170807165718.GW3730@linux.vnet.ibm.com>
 <CAJYFCiN4yhX7gvcag76RNizQ4T62vnR+b=09s262pW3jBuX2dg@mail.gmail.com>
 <CAJYFCiOzh7PHotQqNUt0oK+2BDgN9ujMQMQOtak35iontCfMPg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiOzh7PHotQqNUt0oK+2BDgN9ujMQMQOtak35iontCfMPg@mail.gmail.com>
Message-Id: <20170831221008.GJ4431@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Aug 24, 2017 at 02:30:41AM +0800, Yubin Ruan wrote:
> Hi paul,
>=20
> 2017-08-08 10:12 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > 2017-08-08 0:57 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> >> On Tue, Aug 08, 2017 at 12:48:08AM +0800, Yubin Ruan wrote:
> >>> 2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> >>> > 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.=
com>:
> >>> >> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
> >>> >>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> >>> >>> > Hi,
> >>> >>> > I am sure the subject explain my intention. I got two processes=
 trying
> >>> >>> > to modifying the same place. I want them to do it one after one=
, or,
> >>> >>> > if their operations interleave, I would like to let them know t=
hat the
> >>> >>> > content have been changed and polluted by the other so that the
> >>> >>> > content should be given up. That is, I would rather give up the=
 data,
> >>> >>> > if polluted, than having a false one.
> >>> >>> >
> >>> >>> > I try to set a atomic ref counter, but it seems impossible to d=
o that
> >>> >>> > without a lock to synchronize.
> >>> >>> >
> >>> >>> > Note that I don't want a strict synchronization: the situation =
is a
> >>> >>> > lot better. The data can be given up if that place has been pol=
luted.
> >>> >>>
> >>> >>> Let's explain some of my reasoning: if process A use some flag to
> >>> >>> indicate that it has entered the critical region, then if it crash
> >>> >>> before it can reset the flag, all following processes cannot enter
> >>> >>> that region. But if process A cannot use flag for indication, how=
 to
> >>> >>> other people know (how to synchronization)?
> >>> >>
> >>> >> The simplest approach is to guard the data with a lock.
> >>> >
> >>> > Indeed. But if a process get killed then it will have no chance to =
release
> >>> > the lock...
> >>> >
> >>> > By the way, do you know whether there are any chances that a thread=
 get
> >>> > killed by another thread when doing some "small" things? I mean som=
ething
> >>> > like this:
> >>> >
> >>> >     lock();
> >>> >     some_mem_copying();
> >>> >     unlock();
> >>> >
> >>> > Are there any chance that a thread get killed by another thread bef=
ore it
> >>> > can "unlock()", without the entire process going down?
> >>
> >> Indeed, that is possible.  The pthread_kill() system call if nothing
> >> else.
> >>
> >>> pthread_mutexattr_setrobust(..) will help in this situation, although=
 it is
> >>> quite painful that nobody is maintaining the NPTL docs currently and =
you have
> >>> to dive into the source code if you want to make sure the semantic is=
 exactly
> >>> what you want.
> >>
> >> True on all counts.  But what exactly are you trying to achieve?
> >
> > What I am going to achieve is to allow multiple producer to place some =
content
> > in some slots of a queue. The risk is that some producers might be in t=
he same
> > slot, so that it require some locking to synchronize them. But if you u=
se lock,
> > a thread holding the lock can get killed accidentally (for whatever rea=
sons)
> > before releasing it, causing all the other producers unable to acquire =
it
> > therefore.
>=20
> I got a really great idea for this kind of task. I want to share it with =
you:
>=20
> The case:
> I got a piece of memory(several Kb), and multiple producers try to put co=
ntent
> into that area. A (single) consumer would try to read the content. So the=
re
> are two kind of synchronization: synchronization between producers and
> synchronization between consumer and producers.(Note that there is only o=
ne
> consumer, while a lots of producers)
>=20
> I don't want that single consumer to read intermediate data or dirty data=
 so
> that I need some synchronization mechanism to guarantee that consumer read
> after a producer have finished putting content into that place. Also, I d=
on't
> want multiple producers to write to that place at the same time, since th=
at
> will result in dirty data.
>=20
> Clearly we do not need any lock between consumer and producer, a single f=
lag
> would suffice. But for synchronization between producers, we need lock. T=
he
> algorithm can be represented as follow:
>=20
>     //consumer
>     if (flag =3D=3D DATA_IS_CLEAN) {
>         consumer_read_data();
>         flag =3D DATA_READED; // set it back so that producer can put
> content there after
>     } else {
>         spin_or_return();
>     }
>=20
>     // for every producer
>     if (flag =3D=3D DATA_READED) { // consumer have finished reading
>         if (try_lock()) {
>             put_content();
>             unlock();
>         } else {
>             return;
>         }
>     } else {
>         return;
>     }
>=20
> so now we have the needed synchronization.
>=20
> But the problem is, a producer can simple die after it does
> `put_content()` and before
> `unlock()`. That is awkward, since that effectively means deadlock for
> that memory area.
>=20
> To rescue, we can use a robust lock from pthread, which guarantees
> that if the lock
> holder dies, the next one who tries to acquire the lock will succeed.
> (see pthread_mutexattr_setrobust(3))
>=20
> Pthread's robust lock is great, and is very fast. However, I still
> consider it a litte
> bit heavy and I want to craft my own. I want to make it lock free,
> with some atomic
> instruction. So I come up with a idea: I can use a atomic `xadd'
> instruction for that.
> I can implement my own `try_lock()' like this:
>=20
>     int try_lock() {
>         uint8_t previous_value =3D xadd(&lock, 1);
>         return previous_value =3D=3D 0;
>     }
>=20
> Clearly when *lock =3D=3D 0, some process can xadd it to 1 and
> successfully acquire the lock.
> A correspondingly simple `unlock()' would be:
>=20
>     int unlock() {
>         *lock =3D 0;
>     }
>=20
> Now how do we deal with the deadlock problem? Use wrap around. Because
> every process who
> tries to acquire the lock will xadd 1 to the lock, until some time it
> wrap around and we
> now reach 0 again, which will atomically unlock the lock!! Therefore,
> if the lock owner
> dies, the lock will be unlocked some time.
>=20
> You may ask, what if the lock get wrapped around "too fast" such that
> two process hold the
> lock at the same time? The answer is, make the lock of some bigger
> type, probably uint32_t,
> in which case you have to have 2^32 processes on a system (at the same
> time) to complete
> for that lock, in such a short time(as we are some quick thing inside
> the critical region).
> That would make the race impossible. In my case, because I have a long
> queue, and it takes
> many processes to occupy a queue to reach the original one, a uint8_t
> will suffice.
>=20
> (I am designing some lock-free multi-producers single-consumer message
> queue. The design is
> pretty nice. I will send more later ;-)

This has been a very popular activity over the past few decades.
Here are a few places you can look to see other work in this area:

https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__libcds.sourceforge.ne=
t_&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc7=
0Kq4AkfdiRGMI&m=3D5mSIdU7m-zWoRzIOWcyF6CBuC97xfXdN-6ZV6ZTZ5ng&s=3D4xzHbGb5n=
K-CncZuKm6nblqjqC_cUkRsAuMdyLz2CM8&e=3D=20
https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__liburcu.org&d=3DDwIBA=
g&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGM=
I&m=3D5mSIdU7m-zWoRzIOWcyF6CBuC97xfXdN-6ZV6ZTZ5ng&s=3DwtRaVlqpa2xFZavxYYeT-=
dAcE-x5Z2_7eFJsQM8tsTU&e=3D=20
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_concurren=
cykit_ck&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUm=
PebZc70Kq4AkfdiRGMI&m=3D5mSIdU7m-zWoRzIOWcyF6CBuC97xfXdN-6ZV6ZTZ5ng&s=3D2Eh=
QTKF34p7sFDkGQp_sZias3Gx-VL5dMYAxtzsOC78&e=3D=20

There are quite a few others.

The difficulty with breaking locks is that the state space is quite
large, and can vary based on things like compiler optimizations.
Don't get me wrong, people really do things like this, but it is
not easy.

							Thanx, Paul

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwIBAg&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3D5mSIdU7m-zWoRzIOWcy=
F6CBuC97xfXdN-6ZV6ZTZ5ng&s=3DDMQGJWohAh9EvWvbkdDE7PUopzbeaTM5fIZvmwHRtXI&e=
=3D=20

