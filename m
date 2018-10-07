Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;        bh=k41oadXHJV0/zdzHuJ5Jd/DPI1CZA9YrYJ44mYndWI4=;
 b=kWbrPgLXWdpMxhY9Q2bCJcecLwetTaPaezaRZAwcw91TlzfenUeuewMZiSidIdmmOW
 xRccb7GWUchBf6H/swbH+u9edi2yes4+TAeCUfsuOefUQP9ho9Zq+OHxDTW0pkkq7Y9a
 T76sdmJqlttTU7EAFcfzz2+VGvF98Pu9qr1wn0hvfqjS41NNZQGyhbmubfh6BSvjviJo
 wSxedf7Pb8NANGBJk2IKapr2dcmue5KPGmuF1RmGs0+z+UZXjSJGbbm4E4pmLnuTEj3U
 eQz/3I0Bpmd8UQPo8IUXueq2G9s66C89TfAyffylnuKLwBfNJ49cKz6UXxDj+SHxPRXE
 sNyg==
MIME-Version: 1.0
References: 
 <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
 <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
 <20181001175117.GF4222@linux.ibm.com>
 <CABoNC81Lsi6sC8MCh2T0KrKnt+c1QAVNOm7+601GuRqd8OVopg@mail.gmail.com>
 <20181004153223.GE2674@linux.ibm.com>
 <e5aa1bad-33bb-6ba3-e183-039b4d3bfce8@gmail.com>
In-Reply-To: <e5aa1bad-33bb-6ba3-e183-039b4d3bfce8@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 7 Oct 2018 22:45:24 +0800
Message-ID: 
 <CABoNC83RxXkDAPTU9qXidxTXYuGvQ_o7kPQn3psvmCOrTrhdzA@mail.gmail.com>
Subject: Re: Fwd: Other architectures we can work on?
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Thanks a lot for the detailed information! I will try to deploy the
verification tools (litmus and herd) next week and let you know if
they work.

The PPC server has 8 cores and is currently running Ubuntu 16.04,
which I'm familiar with. Would that be OK? Or do you have any other
suggestions?

BTW, I have successfully applied an ARMv8 server with 96 cores from
packet.com. Since I'm very interested in how non-blocking algorithms
perform on real hardware, I will try to deploy the sample code in
perfbook on all three platforms to see how they work. One interesting
thing I noticed after a quick check is that, for ARMv8, primitive FAA
(__atomic_fetch_add) is performed by using a retry loop that employs
LL/SC, and hence it could lead to a performance degradation (roughly,
10x slower when 30 cores perform FAA concurrently). I will post these
finds in the list later :-)

Thanks,
--Junchang

On Sat, Oct 6, 2018 at 7:47 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On 2018/10/04 08:32:23 -0700, Paul E. McKenney wrote:
> > Hello, Junchang,
> >
> > Glad it worked out for you!
> >
> > Note that the DIY toolset (http://diy.inria.fr/) has things that
> > automatically exercise litmus tests on real hardware.  See the
> > CodeSamples/formal directory in the perfbook archive, and especially
> > its herd and litmus subdirectories, for some example uses.
> > (And kudos to Akira for setting this up!)
>
> Hi Junchang,
>
> At the time I worked in those subdirectories, "ocaml" 4.02.3 for
> powerpc was not capable of natively building DIY toolset.
>
> Current version of ocaml can build the toolset, which means
> you can test litmus tests without cross compiling on powerpc.
>
> But the default target of Makefile under the "litmus" subdirectory
> assumes x86 architecture. For powerpc, you need to use the target
> "cross-pcc" even if you are on a powerpc platform.
>
> One thing I'd like to advise you is that klitmus7 can generate
> kernel module sources which can deadlock. Such deadlock can be
> hard to escape on a remote virtual machine.
>
> herd7 doesn't detect deadlock condition. litmus7 runs litmus tests
> in userland, and it is easier to kill if deadlock happens. litmus7
> is much slower than klitmus7, but it can help in identifying
> possible deadlocks.
>
> Or by running a particular litmus test by klitmus7 on a host
> which can be easily reset if necessary, you can see if it can
> deadlock.
>
> NOTE: api.h in the subdirectory "litmus" predates the merge of
> tools/memoroy-model into Linux kernel, and covers limited subset
> of kernel API used there.
>
> Just out of curiosity, which distribution did you choose for
> your powerpc server?
>
>         Thanks, Akira
>
> >
> >                                               Thanx, Paul
> >
> > On Thu, Oct 04, 2018 at 11:01:00PM +0800, Junchang Wang wrote:
> >> Hi Paul,
> >>
> >> Thanks a lot! OSU has approved my application and provisioned a PPC
> >> server for me. Now I can start testing code on PPC :-). For the ARM
> >> server, the application is still in progress. I'll let you know if
> >> there are any updates.
> >>
> >>
> >> Thank!
> >> --JunchangOn Tue, Oct 2, 2018 at 1:51 AM Paul E. McKenney
> >> <paulmck@linux.ibm.com> wrote:
> >>>
> >>> On Mon, Oct 01, 2018 at 11:23:17AM +0800, Junchang Wang wrote:
> >>>> Forward to list perfbook since the last mail was blocked due to the
> >>>> non-plain-text issue.
> >>>>
> >>>>
> >>>> Hi Paul and list,
> >>>>
> >>>> I'm again reading the excellent 15th chapter (Advanced
> >>>> Synchronization), which helps me eventually understand how a
> >>>> hardware/compiler can optimize--and hence ``break''-- my parallelized
> >>>> code :-).
> >>>>
> >>>> I really want to get my hands dirty and to test my code and samples in
> >>>> perfbook on real servers. However, all servers in my lab are x86. I
> >>>> wonder if there is any chance that we can have access to architectures
> >>>> other than x86 to test code. For example, are there any cloud service
> >>>> that provides access to POWER or ARM architecture?
> >>>
> >>> For POWER access for academic or open-source projects, please see here:
> >>>
> >>> https://osuosl.org/services/powerdev/request_hosting/
> >>>
> >>> There are said to be similar services for ARM, for example:
> >>>
> >>> https://thenewstack.io/cncf-packet-team-provide-free-infrastructure-cloud-developers
> >>>
> >>> Please let me know how it goes!
> >>>
> >>>                                                         Thanx, Paul
> >>>
> >>
> >
>

