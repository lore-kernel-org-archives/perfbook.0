Return-Path: <SRS0=iSjP=DU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691103690; x=1691708490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QltmbKY2fDhPfU67BNswM+SAhufH6Kmh0oZM+dSCFO8=;
        b=g+1uRPpFdWiCUH9kiD95Qvn/RreJdCHS4c9+32qSWqJsopNXSdP3fixK+hbF7ZYYgS
         hP5bSIwAy7MchmznGlM9wqjmk5EJzxB1a/5Y1zQhp3mV5WAv7NQq4u/fhfS5s5R22PhC
         XS5jIZorVpUkr29bE1fvtFAom2C5GYg5h+AWee9xWhWPj3jDDNG5YXzBc1xd6cSz8rZY
         YWvDWID+CsmGmzgBVZhroLhdZVukyKYysjJVQB9hNgr42v8V3Td9TGNk01clLY9NnMgS
         lRf9LgyX9C41Y6l+wd2snQe4w5fb45ukipm6zpWqY6kYjbdFTagCNbac9wX3glv0dpld
         Uoog==
Message-ID: <95eabeb0-0984-69b3-5d4f-61a3c45c7dfd@gmail.com>
Date: Fri, 4 Aug 2023 08:01:27 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 1/5] bib: Use links to lore.kernel.org for LKML
 archive
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
 <204fd5d9-842a-44cd-96c1-3147c773c999@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <204fd5d9-842a-44cd-96c1-3147c773c999@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 3 Aug 2023 14:30:15 -0700, Paul E. McKenney wrote:
> On Fri, Aug 04, 2023 at 12:08:03AM +0900, Akira Yokosawa wrote:
>> Links to http://lkml.iu.edu/hypermail/, https://lkml.org/lkml,
>> and https://marc.info have their own ways of indexing mail messages
>> (not based on message-ids).
>>
>> It should be better to use message-id based URLs for forward
>> compatibility.
>>
>> As lore.kernel.org is expected to be stable and reliable going
>> forward, remove "lastchecked" and "[Viewed MMMM DD, YYYY]" fields
>> along the way.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Very nice, and a lot of work, thank you!!!  Queued and pushed.

By the way, PaulEMcKenney2011WhyIsParallelProgrammingSoHard in
syncrefs.bib, which is next to PaulEMcKenney2011SeidnerInterview
Patch 5/5 updated, has the same (broken) URL as
PaulEMcKenney2011SeidnerInterview.

Google search of "Tom Dunlap" + "Why Is Parallel Programming So Hard"
doesn't hit anything interesting.

Is it OK to remove PaulEMcKenney2011WhyIsParallelProgrammingSoHard ?
perfbook doesn't cite this one, but in case you have other articles/
papers which relies on this one ...

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  bib/RCU.bib      | 120 +++++++++++++++++------------------------------
>>  bib/hw.bib       |   3 +-
>>  bib/os.bib       |   8 ++--
>>  bib/realtime.bib |   6 +--
>>  bib/swtools.bib  |   3 +-
>>  bib/syncrefs.bib |   2 +-
>>  howto/howto.tex  |   2 +-
>>  7 files changed, 51 insertions(+), 93 deletions(-)
>>

