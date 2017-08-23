Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=Uokftab57yAchAEtSiZ78JDSkqSk5vUbT5lU0jOCbao=;
 b=ej4ZRC+s5b2M7jj7XguC/jIxOr6vQaUShYTW9lYarIvfPaexdUUEB/hvGzCNSHdMx4
 E5f2eZghbI0nE/vMgE3XR0NDoq15ni2AoyTu8k0g1jW9cU/VtfY4+j1xWPZzRn5Ww3CJ
 Xxab0/t8TvopdrAVBVMPjNHpoHH0iT6MbN9byrVj7Cxvd9bKOK31rwk11AviW5fPZCB1
 5McV8sdSwhIAcA8+fKjRK7IGLXhSHEVd1S2zIT4MbObkPf4/X2V6/GoCCI9NfHBsU+Gq
 HuNK/ykfvoQqSt6ai2QewaFXyJq1pn9X03CJHAzM5xS+I2ln4b3LKB35JlCeUkIUJvNj
 soqQ==
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
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Thu, 24 Aug 2017 02:30:41 +0800
Message-ID: 
 <CAJYFCiOzh7PHotQqNUt0oK+2BDgN9ujMQMQOtak35iontCfMPg@mail.gmail.com>
Subject: Re: synchronization between two process without lock
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi paul,

2017-08-08 10:12 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> 2017-08-08 0:57 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> On Tue, Aug 08, 2017 at 12:48:08AM +0800, Yubin Ruan wrote:
>>> 2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>>> > 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>>> >> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
>>> >>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
>>> >>> > Hi,
>>> >>> > I am sure the subject explain my intention. I got two processes trying
>>> >>> > to modifying the same place. I want them to do it one after one, or,
>>> >>> > if their operations interleave, I would like to let them know that the
>>> >>> > content have been changed and polluted by the other so that the
>>> >>> > content should be given up. That is, I would rather give up the data,
>>> >>> > if polluted, than having a false one.
>>> >>> >
>>> >>> > I try to set a atomic ref counter, but it seems impossible to do that
>>> >>> > without a lock to synchronize.
>>> >>> >
>>> >>> > Note that I don't want a strict synchronization: the situation is a
>>> >>> > lot better. The data can be given up if that place has been polluted.
>>> >>>
>>> >>> Let's explain some of my reasoning: if process A use some flag to
>>> >>> indicate that it has entered the critical region, then if it crash
>>> >>> before it can reset the flag, all following processes cannot enter
>>> >>> that region. But if process A cannot use flag for indication, how to
>>> >>> other people know (how to synchronization)?
>>> >>
>>> >> The simplest approach is to guard the data with a lock.
>>> >
>>> > Indeed. But if a process get killed then it will have no chance to release
>>> > the lock...
>>> >
>>> > By the way, do you know whether there are any chances that a thread get
>>> > killed by another thread when doing some "small" things? I mean something
>>> > like this:
>>> >
>>> >     lock();
>>> >     some_mem_copying();
>>> >     unlock();
>>> >
>>> > Are there any chance that a thread get killed by another thread before it
>>> > can "unlock()", without the entire process going down?
>>
>> Indeed, that is possible.  The pthread_kill() system call if nothing
>> else.
>>
>>> pthread_mutexattr_setrobust(..) will help in this situation, although it is
>>> quite painful that nobody is maintaining the NPTL docs currently and you have
>>> to dive into the source code if you want to make sure the semantic is exactly
>>> what you want.
>>
>> True on all counts.  But what exactly are you trying to achieve?
>
> What I am going to achieve is to allow multiple producer to place some content
> in some slots of a queue. The risk is that some producers might be in the same
> slot, so that it require some locking to synchronize them. But if you use lock,
> a thread holding the lock can get killed accidentally (for whatever reasons)
> before releasing it, causing all the other producers unable to acquire it
> therefore.

I got a really great idea for this kind of task. I want to share it with you:

The case:
I got a piece of memory(several Kb), and multiple producers try to put content
into that area. A (single) consumer would try to read the content. So there
are two kind of synchronization: synchronization between producers and
synchronization between consumer and producers.(Note that there is only one
consumer, while a lots of producers)

I don't want that single consumer to read intermediate data or dirty data so
that I need some synchronization mechanism to guarantee that consumer read
after a producer have finished putting content into that place. Also, I don't
want multiple producers to write to that place at the same time, since that
will result in dirty data.

Clearly we do not need any lock between consumer and producer, a single flag
would suffice. But for synchronization between producers, we need lock. The
algorithm can be represented as follow:

    //consumer
    if (flag == DATA_IS_CLEAN) {
        consumer_read_data();
        flag = DATA_READED; // set it back so that producer can put
content there after
    } else {
        spin_or_return();
    }

    // for every producer
    if (flag == DATA_READED) { // consumer have finished reading
        if (try_lock()) {
            put_content();
            unlock();
        } else {
            return;
        }
    } else {
        return;
    }

so now we have the needed synchronization.

But the problem is, a producer can simple die after it does
`put_content()` and before
`unlock()`. That is awkward, since that effectively means deadlock for
that memory area.

To rescue, we can use a robust lock from pthread, which guarantees
that if the lock
holder dies, the next one who tries to acquire the lock will succeed.
(see pthread_mutexattr_setrobust(3))

Pthread's robust lock is great, and is very fast. However, I still
consider it a litte
bit heavy and I want to craft my own. I want to make it lock free,
with some atomic
instruction. So I come up with a idea: I can use a atomic `xadd'
instruction for that.
I can implement my own `try_lock()' like this:

    int try_lock() {
        uint8_t previous_value = xadd(&lock, 1);
        return previous_value == 0;
    }

Clearly when *lock == 0, some process can xadd it to 1 and
successfully acquire the lock.
A correspondingly simple `unlock()' would be:

    int unlock() {
        *lock = 0;
    }

Now how do we deal with the deadlock problem? Use wrap around. Because
every process who
tries to acquire the lock will xadd 1 to the lock, until some time it
wrap around and we
now reach 0 again, which will atomically unlock the lock!! Therefore,
if the lock owner
dies, the lock will be unlocked some time.

You may ask, what if the lock get wrapped around "too fast" such that
two process hold the
lock at the same time? The answer is, make the lock of some bigger
type, probably uint32_t,
in which case you have to have 2^32 processes on a system (at the same
time) to complete
for that lock, in such a short time(as we are some quick thing inside
the critical region).
That would make the race impossible. In my case, because I have a long
queue, and it takes
many processes to occupy a queue to reach the original one, a uint8_t
will suffice.

(I am designing some lock-free multi-producers single-consumer message
queue. The design is
pretty nice. I will send more later ;-)

Yubin

> Ideas of RCU can help here, except that I have a statically allocated
> array-based queue, where every slot is addressed by index rather than pointer,
> and because we can not dynamically allocate any space (malloc() not allowed),
> our choices are limited.
>
>> Note that killing a thread not holding any lock can be a problem, for
>> example, suppose the thread that is to place a new element gets killed
>> just before doing so.  How do you intend to handle that situation?
>>
>>> Yubin
>>>
>>> >> But if you don't want to do that, another approach is to restrict the
>>> >> data to one machine word minus one bit, with zero saying that the location
>>> >> is (as you say) unpolluted.  Then you can use a compare-and-swap loop
>>> >> to update the location only if it is unpolluted.
>>> >>
>>> >> But maybe you need more data.  If so, you can have the data separately
>>> >> (perhaps dynamically allocated, perhaps not, your choice), and then use
>>> >> the compare-and-swap method above where NULL says unpolluted.
>>> >
>>> > Good suggestion... although I think it would be pretty painful.
>>
>> Well, if you are going for full-up fault tolerance, you are in for a
>> world of pain regardless.  Fault tolerance is non-trivial any way you
>> look at it.
>>
>> Therefore, my advice is to very carefully work out what your users really
>> need, and implement exactly that.  Doing "just a bit more" in this area
>> usually means incurring a huge amount more pain, often incurred later
>> in the project.
>
> Yes I agree. Designing a lock-free algorithm is full of fun, but nevertheless
> lock-free comes with price.
>
> Thanks,
> Yubin

