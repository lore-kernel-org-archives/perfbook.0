Return-Path: <SRS0=CnNL=YM=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6RAgSZY7z6umiEArDNUSOFhv7vX6KmvWIJWvftd0830=;
        b=VDy0SfzvnhC3c/UyUvOFkKRj9D2/eEg3k1nRtSLhyoFuSt8rxxi9oVkX69ruxsUHxP
         h4EcLZACZr4k4HYKVvJ7RaBFluf02ChuuG/PMyii1DSj8k0CbRg8l0KWCs2yxuwpr7tu
         CO+nWV0lQD91W8TVtTt6qiJJf9DOBbbXFBbg4VsazJH6Iuwviym5utT4VAtA5Ov2xo3y
         NHXeQ7y3ELIlkUdBbG7Mp0TuB7HwPW0lgAHLWoexHWRXSU6UYU3T2JXZx+vH5QaFybDV
         5LBVnNpHHzTJxGSabmLQXWqbswjwJnZjpt9ECHPp9mG/VRWAkZosMRTtzQ2+PFrPf7y/
         A3VQ==
Subject: Re: [PATCH v2] Always generate perfbook.synctex.gz
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <289dfc39-6aec-bbaa-040d-1c06b932949f@gmail.com>
Date: Sat, 19 Oct 2019 20:43:39 +0900
MIME-Version: 1.0
In-Reply-To: <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 18 Oct 2019 00:27:36 +0900, Akira Yokosawa wrote:
> From 41473d36c8bfaf96c4d0d0b3ca04f688ae6d4739 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 18 Oct 2019 00:12:24 +0900
> Subject: [PATCH v2] Always generate perfbook.synctex.gz
> 
> Commit 8458f7572335 ("Add optional flag 'LATEX_OPT' in run{first}latex.sh")
> was ment to support optinal generation of .synctex files.
> It turns out that evince and gedit pair supports both the forward
> (.tex -> PDF) and the inverse (PDF -> .tex) searches [1].
> I find this mechanism helps a lot in perfbook, because of its
> nested LaTeX source structure.
> 
> For forward search (.tex -> PDF) to work, each sub-sources needs
> to have a pointer to main file in the first/last 3 lines. This
> commit therefor adds the pointers to top level perfbook.tex.
> 
> Also add an entry in FAQ-BUILD.txt as an introduction of the
> capability.
> 
> Note: As SyncTeX search will work only for perfbook.pdf, other
> targets do not generate .synctex.gz.
> 
> [1]: https://help.gnome.org/users/evince/stable/synctex-search.html.en
> 
> Cc: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Changes from v1:
> 
> o Simplify setting of LATEX_OPT in Makefile. The behavior is the same as v1.
> o Add Cc: to Balbir.
> 
> I'd like to know this change has no regression with Balbir's workflow.
> I'm assuming Balbir's viewer and editor combination is something
> other than evince and gedit.

Paul, this change does have regression in that the inverse search
(PDF -> .tex) stops working other than perfbook.pdf.

Current master allows inverse search from any of perfbook*.pdf.

So, please hold off this one.

Let me try another round to enable forward search of SyncTeX.

        Thanks, Akira

> 
>         Thanks, Akira
> --
>  FAQ-BUILD.txt                             | 21 +++++++++++++++++++++
>  Makefile                                  |  5 +++++
>  SMPdesign/SMPdesign.tex                   |  2 ++
>  SMPdesign/beyond.tex                      |  4 +++-
>  SMPdesign/criteria.tex                    |  1 +
>  SMPdesign/partexercises.tex               |  2 ++
>  advsync/advsync.tex                       |  2 ++
>  advsync/rcu.tex                           |  2 ++
>  advsync/rt.tex                            |  2 ++
>  appendix/ack/ack.tex                      |  1 +
>  appendix/appendix.tex                     |  1 +
>  appendix/questions/after.tex              |  2 ++
>  appendix/questions/concurrentparallel.tex |  1 +
>  appendix/questions/questions.tex          |  1 +
>  appendix/questions/time.tex               |  1 +
>  appendix/styleguide/styleguide.tex        |  1 +
>  appendix/toyrcu/toyrcu.tex                |  2 ++
>  appendix/whymb/whymemorybarriers.tex      |  2 ++
>  count/count.tex                           |  2 ++
>  cpu/cpu.tex                               |  1 +
>  cpu/hwfreelunch.tex                       |  1 +
>  cpu/overheads.tex                         |  1 +
>  cpu/overview.tex                          |  2 ++
>  cpu/swdesign.tex                          |  1 +
>  datastruct/datastruct.tex                 |  2 ++
>  debugging/debugging.tex                   |  2 ++
>  defer/defer.tex                           |  1 +
>  defer/hazptr.tex                          |  1 +
>  defer/rcu.tex                             |  3 ++-
>  defer/rcuapi.tex                          |  4 +++-
>  defer/rcuexercises.tex                    |  1 +
>  defer/rcufundamental.tex                  |  2 ++
>  defer/rcuintro.tex                        |  2 ++
>  defer/rcurelated.tex                      |  2 ++
>  defer/rcuusage.tex                        |  2 ++
>  defer/refcnt.tex                          |  2 ++
>  defer/seqlock.tex                         |  2 ++
>  defer/updates.tex                         |  3 ++-
>  defer/whichtochoose.tex                   |  1 +
>  easy/easy.tex                             |  1 +
>  formal/axiomatic.tex                      |  2 ++
>  formal/dyntickrcu.tex                     |  2 ++
>  formal/formal.tex                         |  1 +
>  formal/ppcmem.tex                         |  4 +++-
>  formal/sat.tex                            |  1 +
>  formal/spinhint.tex                       |  2 ++
>  formal/stateless.tex                      |  1 +
>  future/cpu.tex                            |  1 +
>  future/formalregress.tex                  |  1 +
>  future/future.tex                         |  1 +
>  future/htm.tex                            |  2 ++
>  future/tm.tex                             |  2 ++
>  glossary.tex                              |  1 +
>  howto/howto.tex                           |  2 ++
>  intro/intro.tex                           |  1 +
>  legal.tex                                 |  1 +
>  locking/locking-existence.tex             |  4 +++-
>  locking/locking.tex                       |  2 ++
>  memalloc/memalloc.tex                     |  1 +
>  memorder/memorder.tex                     |  2 ++
>  owned/owned.tex                           |  2 ++
>  together/applyrcu.tex                     |  2 ++
>  together/count.tex                        |  1 +
>  together/hash.tex                         |  1 +
>  together/refcnt.tex                       |  2 ++
>  together/together.tex                     |  1 +
>  toolsoftrade/toolsoftrade.tex             |  2 ++
>  67 files changed, 131 insertions(+), 6 deletions(-)
> 
[...]
