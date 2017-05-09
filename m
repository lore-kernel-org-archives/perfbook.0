Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=33MrjzZgtT6OFjy1ErLYTcqqBa+0BYJ4Uj1/gg9WXUc=;
 b=SSBQc+3J/Gg0+/IPPkIIB68tUBxxayU+/pp/BFRrOeab+bvKeEtDg3nIQ5roztRvhI
 THWUXlfXYA8yFPtBQjQklXoDEgTmDCLMg42BRaPwpE4nrLhLppkGBxpOCd2kZiTIgQse
 GlQLnSuOVNNXCqqwEimdi5Ou9j25P7Rd0h70EbsHzw5QxT2VlDw+BE/C42Srsk/bYqle
 QfRyj9jXNOSvu5WYFBZJUEmK0Fp1D88OFfNTHq/OdowBEBQwMTnLdmPjhhKv+wo+KVfV
 PatMj05QtfmpZDhupE18NKpdVMjDeEre6VkVs5+jsw53cW3gEWNKpHCfPxoM+Zk+OpxO
 UIbA==
Date: Tue, 9 May 2017 23:58:21 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Re: The weird re-ordering issue of the Alpha arch'
Message-ID: <20170509155818.GA4123@HP>
References: <20170429142605.GC2536@master>
 <20170501155816.GB3956@linux.vnet.ibm.com> <20170508132523.GA7570@HP>
 <20170508155052.GA3956@linux.vnet.ibm.com> <20170509110758.GA5835@HP>
 <20170509042132.GJ3956@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170509042132.GJ3956@linux.vnet.ibm.com>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, May 08, 2017 at 09:21:32PM -0700, Paul E. McKenney wrote:
> On Tue, May 09, 2017 at 07:08:01PM +0800, Yubin Ruan wrote:
> > On Mon, May 08, 2017 at 08:50:52AM -0700, Paul E. McKenney wrote:
> > > On Mon, May 08, 2017 at 09:25:28PM +0800, Yubin Ruan wrote:
> > > > On Mon, May 01, 2017 at 08:58:16AM -0700, Paul E. McKenney wrote:
> > > > > On Sat, Apr 29, 2017 at 10:26:05PM +0800, Yubin Ruan wrote:
> > > 
> > > [ . . . ]
> > > 
> > > > Hmm...that reminds me of some words in the perfbook. In the answer of quick quiz 4.17,
> > > > you state that:
> > > > 
> > > >     Memory barrier only enforce ordering among multiple memory references: They do
> > > >     absolutely nothing to expedite the propogation of data from one part of the system
> > > >     to another. This leads to a quick rule of thumb:  You do not need memory barriers
> > > >     unless you are using more than one variable to communicate between multiple threads.
> > > > 
> > > > Is that only true for the Alpha processor? I mean, on platforms other than
> > > > Alpha (e.g x86), memory barrier *do* expedite the propogation of data from one
> > > > processor/core to other processor/core, even though that is not officially documented.
> > > 
> > > Can you point me at any unofficial documentation of this, for example,
> > > any performance measurements indicating that (for example) the mfence
> > > instruction speeds up the propagation of previous writes to other CPUs?
> > 
> > Hmm...I might had had too much drug at that moment. What I mean is that, on platform
> > like x86, memory barrier instructions(e.g sfence) enforce that the order of some memory
> > references are preserved as the same as in the origin processor by another processors.
> > However, any speedup is not guaranteed.
> 
> Hey, I was hoping!  ;-)

Ah...sorry to dispoint you. :)
Maybe some memory barrier instructions do have some speedup side effect to
"expedite" the propogation of previous writes. Maybe try to consult some Intel
engineer about this...?
It would be good to have some experiments to measure this. But currently I don't
know how to carry out the experiment myself. Do you have any plan or idea?

Thanks,
Yubin

> 
> 							Thanx, Paul
> 
> > Regards,
> > Yubin
> > 
> > > In the absence of such documentation, all I can really do is change
> > > "They do absolutely nothing to expedite..." to something like "They are
> > > not guaranteed to do anything to expedite..."
> > > 
> > > 							Thanx, Paul
> > > 
> > > > ---
> > > > Yubin
> > > > 
> > > > > > 
> > > > > > [1]: https://www.cs.umd.edu/~pugh/java/memoryModel/AlphaReordering.html
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 

