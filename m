Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vs+9utN5DRD+c45G+3omSY33U1LORPY1loKrBjickpE=;
 b=AYF4tbam6XNv62VOg5277J3ozoN5It2mCIWMlc8pKJwIO0sZ2mqJh1z1y9c0Z3X26L
 5GVtv5jKhxitzb6gs+WHbSTeCy9vfjj3ZDTtAM/HTUOkXUGZvE62MGCJaOGZcsw5UEMz
 izVL87RhmuoDZ6elod6s6ue9X4Jfo7KgXaIkE8UgUyRa2qzakkXX7ZKvptNMMpwgxXnG
 uqX7ag8GUZyDVbjAer+/8HR3CsKl16QugA6vXGakwsJeTTVAQo1uXjijLZLZMywKB5Lj
 QJXOJtfKa0dnoyIyXWs9BTseWUWjyHlWlMScOfiGIOWcXQ/iDDRny7jZB5DtPOU4Bfax
 TE7g==
Date: Wed, 11 Apr 2018 10:46:28 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: different kind of memory reordering clarification
Message-ID: <20180411024538.grp62hwvtxpapzeh@HP>
References: <20180410121408.4fik54wftqvesk65@HP>
 <20180410152024.rq6aynzvbgeyogma@HP>
 <20180410170409.GX3948@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410170409.GX3948@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Apr 10, 2018 at 10:04:09AM -0700, Paul E. McKenney wrote:
> On Tue, Apr 10, 2018 at 11:20:24PM +0800, Yubin Ruan wrote:
> > On Tue, Apr 10, 2018 at 08:14:08PM +0800, Yubin Ruan wrote:
[...]
> > > 
> > > Can you please provide me with some examples or references for different kinds
> > > of memory reordering in a SMP system? You know, there are different kinds of
> > > reordering:
> > > 
> > >    - Loads reordered after loads
> > >    - Loads reordered after stores
> > >    - Stores reordered after stores
> > >    - Stores reordered after loads
> > >    - Atomic reordered with loads
> > >    - Atomic reordered with stores
> > >    - Dependent loads reordered (DEC alpha)
> > 
> > I remember there is open-std.org webpage containing comparision of C++'s
> > memory model to those primitives used in the Linux kernel. But I just can't
> > find that page.
> 
> Here you go!
> 
> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
> 
> There will be an update in a month or so, but the above is pretty
> close.  Also, the Linux-kernel memory model was presented at
> ASPLOS and accepted into the Linux kernel itself:
> 
> https://paulmck.livejournal.com/49667.html

Many thanks. But I am currently confused about the relationship between
terminologies used in the Linux kernel and those used in some programming
languages (e.g., C++), i.e., the relationships between

    memory_order_release
    memory_order_relaxed
    memory_order_acquire
    memory_order_seq_cst
    ...

and those used in the kernel:

    READ_ONCE() / WRITE_ONCE()
    rmb() / wmb() / mb() / smp_mb()
    ...

Any materials for that?

Yubin

