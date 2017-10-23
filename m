Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=SaqowPS0i52V9TGbYuVIGIo1P8GJb5uFfHAfO8ESDaM=;
 b=um8UIYE1Xl7z08Ne5BEl80P8R4vDwWXbyGmynrr2gtNKAzFsEsJKR1d7JggpTvlwFC
 FsLE+mm6JWhQg5n9ZT2rvSjqaw6gV1lsCnTBZGKHi8dPMJ9jUg8CSg3Zd01gXHhIAHzx
 gFYcvEhDjFaIkr3rwogH9ATAMbjp8rVoOhWOHcW+k8dJAmIiZZdylXAwNTuaPrSDfY6f
 fENOLGhj9YJd/xTbvNHS1ybRdqyjmTeF7hEUvXoRokBkGZiayMjZCEMT6V0/Upx/DL6G
 qA3pBxKqhK7DtqhGCH6Q1Hi3iLnzTPGLm5pfQ+nBodplYnJhI8+uVnf05eF+NkiZbKDe
 UfYQ==
MIME-Version: 1.0
In-Reply-To: <20171023020104.GI3659@linux.vnet.ibm.com>
References: 
 <CAJYFCiPGe4NaZMef_-gXF4Oyk8tP+DhmPYfrhgvEEHzTnmm59g@mail.gmail.com>
 <20171021174525.GN3521@linux.vnet.ibm.com>
 <CAJYFCiMJsxxwDzurMvYFc7XzFYdk_nYQBK+1hKFPm7-jsfjbuA@mail.gmail.com>
 <20171023020104.GI3659@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Mon, 23 Oct 2017 13:47:49 +0800
Message-ID: 
 <CAJYFCiMD=ZX-b9r5ooWa1LyKUMO8OiZr16m-B=5ARvjpuCkZQg@mail.gmail.com>
Subject: Re: Probably redundant code at listing 7.7
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thanks Paul,

2017-10-23 10:01 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> On Sun, Oct 22, 2017 at 02:41:39PM +0800, Yubin Ruan wrote:
>> Thanks paul,
>>
>> 2017-10-22 1:45 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
>> > On Sat, Oct 21, 2017 at 09:58:12PM +0800, Yubin Ruan wrote:
>> >> Hi,
>> >>
>> >> In Listing 7.7, a hierarchy/conditional locking example is used to
>> >> show how to reduce how contention:
>> >>
>> >> 1 void force_quiescent_state(struct rcu_node *rnp_leaf)
>> >> 2 {
>> >> 3      int ret;
>> >> 4      struct rcu_node *rnp = rnp_leaf;
>> >> 5      struct rcu_node *rnp_old = NULL;
>> >> 6
>> >> 7      for (; rnp != NULL; rnp = rnp->parent) {
>> >> 8          ret = (ACCESS_ONCE(gp_flags)) ||
>> >> 9                  !raw_spin_trylock(&rnp->fqslock);
>> >> 10         if (rnp_old != NULL)
>> >> 11             raw_spin_unlock(&rnp_old->fqslock);
>> >> 12         if (ret)
>> >> 13             return;
>> >> 14         rnp_old = rnp;
>> >> 15     }
>> >> 16     if (!ACCESS_ONCE(gp_flags)) {
>> >> 17         ACCESS_ONCE(gp_flags) = 1;
>> >> 18         do_force_quiescent_state();
>> >> 19         ACCESS_ONCE(gp_flags) = 0;
>> >> 20     }
>> >> 21     raw_spin_unlock(&rnp_old->fqslock);
>> >> 22 }
>> >>
>> >> I understand the purpose and most of the implementation of the code.
>> >> But one thing I don't really understand is that why we need line 16
>> >> here? By reaching line 16, we can be sure that that particular process
>> >> have already acquired the fqslock of the root node and it should be
>> >> the only one to reach there. So, it will always see gp_flags == 0 when
>> >> reaching line 16.
>> >>
>> >> Did I miss anything? I read Quick Quiz 7.21 and it seems that there
>> >> might be some tricky things there.
>> >
>> > Within the confines of this particular example, you miss nothing.
>> >
>> > I simplified the code from that in the Linux kernel, which you can see at
>> > http://elixir.free-electrons.com/linux/latest/source/kernel/rcu/tree.c#L2942
>>
>> I check the kernel source code and now I understand how this technique
>> is implemented. One thing that you might find interesting is the code
>> in `rcu_gp_kthread_wake()' only check against the flag using
>> `!READ_ONCE(rsp->gp_flags)', but I think for code consistency it
>> should be something like `(READ_ONCE(rsp->gp_flags) &
>> RCU_GP_FLAG_FQS)' ...?
>
> The reason it does not check for RCU_GP_FLAG_FQS is that this same
> function is also used for starting new grace periods, which uses a
> different flag.
>
>> > In that code, force_quiescent_state() doesn't clear ->gp_flags itself,
>> > it instead invokes rcu_gp_kthread_wake() to wake up another kernel
>> > thread.  This means that the second CPU can acquire the root-level
>> > ->fqslock and see ->gp_flags equal to 1.
>> >
>> > So how should I fix this example?
>> >
>> > One approach would be to drop the check on line 16, as reflected in
>> > your question.  The downside of this approach is that two closely
>> > spaced calls to force_quiescent_state() might needlessly both call
>> > do_force_quiescent_state() -- the first call would service both requests,
>> > so the second call would be needless overhead.  But perhaps that is too
>> > detailed a consideration.
>> >
>> > Another approach would be to move line 19 to follow line 21, possibly
>> > with a timed wait in between.  The idea here is that you never need to
>> > invoke do_force_quiescent_state() more than (say) ten times a second,
>> > so the "winner" waits a tenth of a second before clearing gp_flags.
>> >
>> > A third approach would be to add the wake-up code from the Linux kernel
>> > back into the example.
>> >
>> > Right now, the timed-wait approach seems best, as it is simple, yet
>> > teaches the point of this technique.  But does anyone have a better idea?
>>
>> I think we should choose the timed-wait approach. The third approach
>> is not an wise option as the book is concerned. The first approach
>> might be a choice, but, after a few seconds of thinking, I think it is
>> not "sophisticated" enough ;-)
>
> Sounds good, thank you!  I took a shot at this, what do you think?

I am definitely OK with this. Unless anyone has any smart solution
which can make it both 1) understandable, 2) efficient, I think you
should follow the timed-wait approach and merge that in.

I am still looking around at other chapters so I will leave that.
Maybe Akira can put some comments on this?

Yubin

