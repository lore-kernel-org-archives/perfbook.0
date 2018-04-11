Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;        bh=56c8iiOLnZ9wt08PSn16Av+nJMzEZfeoRfXERkc1a0Q=;
 b=AWh/nV4vv3zAoz0H+lU9LK/BEhFef7ZJOfZo3t2UbpR9HqZUhXqFfeaQhILMPxxhnr
 bW6bArTawHRikunxfC2E5J6yFl+gFMiF5La2UlFhoC3YfKckKUDGr6CGeIrdQT4SL04X
 dvZG35EEELk/rDhmZd2b+tc8erpmCBO9agwj1gtN+pOeo8dNauWmD3fIZJk9eZar8vs5
 5o7W+Qvn8g+QvpXv1ZcZVv2U+lzAwpsZeconMtToLUM0vO2aQf14xFby+AhJq77ZkMYh
 gd71dp9VsDN+0K1achsymV1yB5RNvf3QerQVwNStFd/Re8QJS87Rl8c4K9vWTQV5nIEE
 Lu6Q==
Date: Wed, 11 Apr 2018 11:00:58 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: different kind of memory reordering clarification
Message-ID: <20180411030058.dwnk52wctplchxbt@HP>
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
 <20180411024538.grp62hwvtxpapzeh@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180411024538.grp62hwvtxpapzeh@HP>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, Apr 11, 2018 at 10:46:28AM +0800, Yubin Ruan wrote:
> On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> > On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
> [...]
> > > > 
> > > > Can you please provide me with some examples or references for different kinds
> > > > of memory reordering in a SMP system? You know, there are different kinds of
> > > > reordering:
> > > > 
> > > >    - Loads reordered after loads
> > > >    - Loads reordered after stores
> > > >    - Stores reordered after stores
> > > >    - Stores reordered after loads
> > > >    - Atomic reordered with loads
> > > >    - Atomic reordered with stores
> > > >    - Dependent loads reordered (DEC alpha)
> > > 
> > > I remember there is open-std.org webpage containing comparision of C++'s
> > > memory model to those primitives used in the Linux kernel. But I just can't
> > > find that page.
> > 
> > Here you go!
> > 
> > http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> > 
> > There will be an update in a month or so, but the above is pretty
> > close.  Also, the Linux-kernel memory model was presented at
> > ASPLOS and accepted into the Linux kernel itself:
> > 
> > https://paulmck.livejournal.com/49667.html
> 
> Many thanks. But I am currently confused about the relationship between
> terminologies used in the Linux kernel and those used in some programming
> languages (e.g., C++), i.e., the relationships between
> 
>     memory_order_release
>     memory_order_relaxed
>     memory_order_acquire
>     memory_order_seq_cst
>     ...
> 
> and those used in the kernel:
> 
>     READ_ONCE() / WRITE_ONCE()
>     rmb() / wmb() / mb() / smp_mb()
>     ...
> 
> Any materials for that?

Hmm, to be more exact, what I want is something like this:

    “These primitives can be expressed directly in terms of the upcoming
    C++0x standard. For the smp_mb() primitive this correspondence is not
    exact; our memory barriers are somewhat stronger than the standard’s
    atomic_thread_fence(memory_order_seq_cst). The LOAD_SHARED() primitive
    maps to x.load(memory_order_relaxed) and STORE_SHARED() to
    x.store(memory_order_relaxed). The barrier() primitive maps to
    atomic_signal_fence(memory_order_seq_cst). In addition, rcu_dereference()
    maps to x.load(memory_order_consume) and rcu_assign_pointer() maps to
    x.store(v, memory_order_release).”

This is extracted from the paper "User-Level Implementations of Read-Copy
Update" by M. Desnoyers and P. McKenney,  A. S. Stern, M. R. Dagenais and J.
Walpole[1]. And the LOAD_SHARED() and STORE_SHARED() above are READ_ONCE() and
WRITE_ONCE(), respectively. (BTW, LOAD_SHARED/STORE_SHARED seem to be better
names than READ_ONCE/WRITE_ONCE, which are a bit confusing. How come people
adopted those name?)

(I find this after digging into a whole bunch of emails...hmm..email is a good
thing)

[1]: https://www.efficios.com/pub/rcu/urcu-main-accepted.pdf

Yubin

