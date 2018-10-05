Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QghXQzaaQMs9ARN56yi+E2cd+RgieQSMVLPvsnoHCsg=;
 b=UmKaBw900UTt5ye1rdaYnDDA8owxZJ0pQfC29UMBZR/Wfd67KdLgBJYO/Hsw/ysX0p
 q4qVWqiBSuZe527ftQoyHX6f6rLQVhG+HVr+U35zEnKHHi22MxGSiKPj3kYDDamxXTRK
 pIcG2MsbrvwS6GDsYexnanNaauK1UQocOe3WE6ZxpHcEypLpQLWPDBZ6icO7nb8kujwX
 7DZk0f3gcU7vv87YaROBabQX0NTb/kKLHQ/g6t4wxskeS2BNePE5wUk6UJyTJ59fKaj7
 l8FK97OBIK4iPskZQnfE0MBHSvFm5OlDS/eGnd0lpntzIMzy8jiCwozuco3v8FkFzI8i
 bxZg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: Fwd: Other architectures we can work on?
References: 
 <CABoNC81BJOPV3oBQ-Q9m9-5VZAdWq0L_r+4m6Wv7QWuXQo1LnA@mail.gmail.com>
 <CABoNC82ftdi_Ki-zhwv2xC1HVC4=O-wGvF+wS+MSCEa8ETctXQ@mail.gmail.com>
 <20181001175117.GF4222@linux.ibm.com>
 <CABoNC81Lsi6sC8MCh2T0KrKnt+c1QAVNOm7+601GuRqd8OVopg@mail.gmail.com>
 <20181004153223.GE2674@linux.ibm.com>
Message-ID: <e5aa1bad-33bb-6ba3-e183-039b4d3bfce8@gmail.com>
Date: Sat, 6 Oct 2018 08:47:32 +0900
MIME-Version: 1.0
In-Reply-To: <20181004153223.GE2674@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/04 08:32:23 -0700, Paul E. McKenney wrote:
> Hello, Junchang,
> 
> Glad it worked out for you!
> 
> Note that the DIY toolset (http://diy.inria.fr/) has things that
> automatically exercise litmus tests on real hardware.  See the
> CodeSamples/formal directory in the perfbook archive, and especially
> its herd and litmus subdirectories, for some example uses.
> (And kudos to Akira for setting this up!)

Hi Junchang,

At the time I worked in those subdirectories, "ocaml" 4.02.3 for
powerpc was not capable of natively building DIY toolset.

Current version of ocaml can build the toolset, which means
you can test litmus tests without cross compiling on powerpc.

But the default target of Makefile under the "litmus" subdirectory
assumes x86 architecture. For powerpc, you need to use the target
"cross-pcc" even if you are on a powerpc platform.

One thing I'd like to advise you is that klitmus7 can generate
kernel module sources which can deadlock. Such deadlock can be
hard to escape on a remote virtual machine.

herd7 doesn't detect deadlock condition. litmus7 runs litmus tests
in userland, and it is easier to kill if deadlock happens. litmus7
is much slower than klitmus7, but it can help in identifying
possible deadlocks.

Or by running a particular litmus test by klitmus7 on a host
which can be easily reset if necessary, you can see if it can
deadlock.

NOTE: api.h in the subdirectory "litmus" predates the merge of
tools/memoroy-model into Linux kernel, and covers limited subset
of kernel API used there.

Just out of curiosity, which distribution did you choose for
your powerpc server?

        Thanks, Akira

> 
> 						Thanx, Paul
> 
> On Thu, Oct 04, 2018 at 11:01:00PM +0800, Junchang Wang wrote:
>> Hi Paul,
>>
>> Thanks a lot! OSU has approved my application and provisioned a PPC
>> server for me. Now I can start testing code on PPC :-). For the ARM
>> server, the application is still in progress. I'll let you know if
>> there are any updates.
>>
>>
>> Thank!
>> --JunchangOn Tue, Oct 2, 2018 at 1:51 AM Paul E. McKenney
>> <paulmck@linux.ibm.com> wrote:
>>>
>>> On Mon, Oct 01, 2018 at 11:23:17AM +0800, Junchang Wang wrote:
>>>> Forward to list perfbook since the last mail was blocked due to the
>>>> non-plain-text issue.
>>>>
>>>>
>>>> Hi Paul and list,
>>>>
>>>> I'm again reading the excellent 15th chapter (Advanced
>>>> Synchronization), which helps me eventually understand how a
>>>> hardware/compiler can optimize--and hence ``break''-- my parallelized
>>>> code :-).
>>>>
>>>> I really want to get my hands dirty and to test my code and samples in
>>>> perfbook on real servers. However, all servers in my lab are x86. I
>>>> wonder if there is any chance that we can have access to architectures
>>>> other than x86 to test code. For example, are there any cloud service
>>>> that provides access to POWER or ARM architecture?
>>>
>>> For POWER access for academic or open-source projects, please see here:
>>>
>>> https://osuosl.org/services/powerdev/request_hosting/
>>>
>>> There are said to be similar services for ARM, for example:
>>>
>>> https://thenewstack.io/cncf-packet-team-provide-free-infrastructure-cloud-developers
>>>
>>> Please let me know how it goes!
>>>
>>>                                                         Thanx, Paul
>>>
>>
> 

