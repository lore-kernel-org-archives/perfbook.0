Return-Path: <SRS0=wfcr=SO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SMrGYWZivEXRS4VgEB7hx9HbR5cCv12T37pB/7K9NZs=;
        b=ayQLZnnXlzXNIdaDr8DOhYkgV/QMlYu+NhLN+zH2NJBIrY/7GqeaBmvOc/SRud34dZ
         My3UATvJ85oLLtJdfnE3TBtDBzT58psW1FZoL5CfkpFEoW8hI2jQ2BJvKYAzV7a7dkK0
         tURomWDPq6HG+E/jmAk5VdZeo0k3ZKnS5IdwMv+JKyT8J2NoTvVauv2MEA9oTp0OnSI1
         J7HE5Q6NkPqzl90eldnjMh8HgGUtkSeCp+YYZ0bILzSfe/LiyahaGfY7nkrBU4K62YEs
         2WnCOUOTLydhDaC3u0UExQ4nhNA31iNGK/cFvj9bgc86G5BrU7kweHyvDL819nFq2IMg
         crjw==
Message-ID: <92c18a74-e182-6e23-ff57-e3de19780fb4@gmail.com>
Date: Sun, 30 Jan 2022 18:30:56 +0900
MIME-Version: 1.0
Subject: Re: [RFT PATCH -perfbook v3 v3 0/4] Enable parallel runs of pdflatex
Content-Language: en-US
References: <e4f48e3d-7efe-f822-1002-6836d63b542f@gmail.com>
 <20220130043603.GR4285@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220130043603.GR4285@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sat, 29 Jan 2022 20:36:03 -0800, Paul E. McKenney wrote:
> On Sat, Jan 29, 2022 at 08:19:33PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> I said earlier in v2's thread:
>>
>>> This patch changes both LaTeX code and Makefile.
>>> SyncTeX database is affected by LaTeX code change because
>>> it is a collection of "LaTeX code (file:line:char) <->
>>> coordinates in PDF".
>>> So we can't see if changes in Makefile affect PDF or not.
>>>
>>> I'll split this patch into a set of "preparatory LaTeX change"
>>> and "Makefile update" patches.
>>
>> I did break up the patch (1/4 and 2/4), but it did not work as I
>> had expected.
>> Because of the Git-commit info in the footer area, SyncTeX database
>> can't be identical when you move to another commit.
>>
>> So, I restored the Makefile as of 2022.01.25 for reference (3/4)
>> and added a script to collect and compare SyncTeX databases from
>> reference, sequential, and parallel runs of pdflatex (4/4).
>>
>> Please give it a try.
>>
>> You can override defaults of TARGETS (2c 1c eb) and JOBS (4) by
>> saying, e.g.:
>>
>>   TARGETS="2c 1c eb nq 1cnq ebnq" JOBS=8 ./utilities/parallel-latex-regress.sh
>>
>> It will take quite a while for sequential runs of pdflatex with
>> the synctex option enabled.  So I'd suggest starting from a short
>> list.
>>
>> In my tests so far, no mismatch was detected.
> 
> Thank you, especially for the script!  I applied these patches, but I
> get an exit code of 1.  Ah, but that is because "2cnq" is not a thing.
> Trying again with:
> 
> TARGETS="2c 1c eb 1cnq nq ebnq" time ./utilities/parallel-latex-regress.sh
> 
> And I still got mismatches and an exit code of 1, with output shown
> below.  Any hints?

Paul, you did find a regression in the changes of 2/4.
I did not expect the script would actually catch such a bug.

The "sorting out" in 2/4 caused autodate.sh to see temporary
untracked files from concurrent conversions of figures.

I'm sending a followup patch (5/4) partially reverting 2/4.
I should have run the test under a newly cloned Git repository...

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
[...]
> /tmp/perfbook.ref.synctex.gz /tmp/perfbook.sequ.synctex.gz differ: byte 3690, line 6
> /tmp/perfbook.ref.synctex.gz /tmp/perfbook.para.synctex.gz differ: byte 3690, line 6
> /tmp/perfbook-1c.ref.synctex.gz /tmp/perfbook-1c.sequ.synctex.gz differ: byte 3720, line 5
> /tmp/perfbook-1c.ref.synctex.gz /tmp/perfbook-1c.para.synctex.gz differ: byte 3720, line 5
> /tmp/perfbook-eb.ref.synctex.gz /tmp/perfbook-eb.sequ.synctex.gz differ: byte 3705, line 8
> /tmp/perfbook-eb.ref.synctex.gz /tmp/perfbook-eb.para.synctex.gz differ: byte 3705, line 8
> /tmp/perfbook-1cnq.ref.synctex.gz /tmp/perfbook-1cnq.sequ.synctex.gz differ: byte 3722, line 4
> /tmp/perfbook-1cnq.ref.synctex.gz /tmp/perfbook-1cnq.para.synctex.gz differ: byte 3722, line 4
> /tmp/perfbook-nq.ref.synctex.gz /tmp/perfbook-nq.sequ.synctex.gz differ: byte 24, line 1
> /tmp/perfbook-nq.ref.synctex.gz /tmp/perfbook-nq.para.synctex.gz differ: byte 24, line 1
> /tmp/perfbook-ebnq.ref.synctex.gz /tmp/perfbook-ebnq.sequ.synctex.gz differ: byte 3701, line 7
> /tmp/perfbook-ebnq.ref.synctex.gz /tmp/perfbook-ebnq.para.synctex.gz differ: byte 3701, line 7
> Mismatch detected in SyncTeX databases!
> Command exited with non-zero status 1
> 2230.23user 110.37system 27:21.46elapsed 142%CPU (0avgtext+0avgdata 127116maxresident)k
> 0inputs+4072584outputs (263249major+15113217minor)pagefaults 0swaps
