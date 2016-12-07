Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:references:cc:to:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=x8KrZh0yf+z+K2H4IXlGV1YDlX27j62ny4io0r0Jzns=;
 b=Pbjv9zaz2M+0kK9y7nQiNEGHXxIjYPWhQXrw5v7ZNaelqJZbGbJpJ8GRICapx7IGDy
 xN0iQHJli/tFzWntYpTl4T8sN7YFi7AG1ByCzNjjoJVI4mIq/OSr0ZN2G+TxQW/xdKID
 dpO5TnoLFsVdyZtBhvljB1YglDzKWUl4kF3GKuKPkFTBrnLFpZud3KgGzi2H5Jpb/CgF
 8N5PycRRoLlIE3nzEBQMpLhkF8A/xt4xcC/1O77pA/Gsqh0FSkjyTHPnpkXoH4b4BcLY
 CE4zfJIDC9LqlXSPYKKES1V1kGvCQrH9al3wN07p8RNjWl4Urvdc/G3rQUb3se6fgDW9
 6XlQ==
Subject: Re: [RFC PULL] bib: Append DOI fields
References: <ed2fcfd1-0a00-8b8a-e106-bd715ee416d0@gmail.com>
 <20161206140757.GF3924@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37c815a4-9d78-82a0-d811-b97009f67e39@gmail.com>
Date: Thu, 8 Dec 2016 00:01:06 +0900
MIME-Version: 1.0
In-Reply-To: <20161206140757.GF3924@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/12/06 06:07:57 -0800, Paul E. McKenney wrote:
> On Sat, Dec 03, 2016 at 05:26:15PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> Seems like you were very busy this couple of weeks at the RCU front.
>> Meanwhile, I did my homework of bibliography cleanups.
>>
>> This pull request consists of easy patches just appending DOI fields.
>> I thought it would be easier for you to apply them to your private
>> repository if I split them to individual commits.
>> So there are 50 commits of one-liner.
>>
>> I can squash them if you'd like them to be.
>>
>> And there is no visual effect in the resulting bibliography output at
>> the moment. They will be embedded as hyperlinks once we switch
>> bibliography style to the url-aware "alphapf".
>>
>> I'm preparing other branches to append or salvage URLs.
>> Tree-wide format changes can be done later (if I can manage to write
>> a script), but when I update a URL in a note field, I'll remove
>> "Available:" and "[Viewed ...]", then append a "lastchecked" field.
>>
>> Thoughts?
>>
>>                                               Thanks, Akira
> 
> They look like great improvements!

Good to know what you feel. ;-)

> 
> Having them split up works best for me.  I will incorporate them, but
> it may be a few days before I get to it.

I see.

> My process is to pull your changes into a separate branch, apply the
> changes incrementally to my source bibtex archive, use a script to pull
> the changes into perfbook, and "git diff" against the separate branch
> to check each step.
> 
> If you know of a better way, please don't keep it a secret.  ;-)

I have no better idea. Actually speaking, I worried a bit that 50 separate
commits might overwhelm you. But I'm relieved to know you prefer this way.

                                                 Thanks, Akira
> 
> 							Thanx, Paul
> 
>> ----
>> The following changes since commit 345ba95e4a578614247a7077602026dd7f6b1dd0:
>>
>>   Add Joe Duffy citations to STM discussion (2016-12-02 09:32:16 -0800)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git bib-append-doi
>>
>> for you to fetch changes up to 8b3c3e02533a28e599448051bddf13e5cac615fe:
>>
>>   bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock (2016-12-03 09:00:31 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (50):
>>       bib/perfmeas: Append doi to Anderson97
>>       bib/cyncrefs: Append doi to HagitAttiya2011LawsOfOrder
>>       bib/swtools: Append doi to JadeAlglave2013-cav
>>       bib/parallelsys: Append doi to GeneAmdahl1967AmdahlsLaw
>>       bib/syncrefs: Append doi to Anderson90
>>       bib/TM: Append doi to Blundell2006TMdeadlock
>>       bib/TM: Append doi to CalinCascaval2008tmtoy
>>       bib/syncrefs: Append doi to Courtois71
>>       bib/RCU: Append doi to AustinClements2012RCULinux:mmapsem
>>       bib/TM: Append doi to AleksandarDragovejic2011STMnotToy
>>       bib/swtools: Append doi to VijayDSilva2012-sas
>>       bib/syncrefs: Append doi to Dijkstra65a
>>       bib/TM: Append doi to DavidDice:2010:SCA:HTM:deque
>>       bib/os: Append doi to Cheriton96a
>>       bib/RCU: Append doi to DinakarGuniguntala2008IBMSysJ
>>       bib/syncrefs: Append doi to Graunke90
>>       bib/WFS: Append doi to MauriceHerlihy90a
>>       bib/WFS: Append doi to Herlihy91
>>       bib/syncrefs: Append doi to AndreasHaas2013CFRelaxedQueues
>>       bib/syncrefs: Append doi to AndreasHaas2012FIFOisnt
>>       bib/WFS: Append doi to HerlihyLM02
>>       bib/TM: Append doi to Herlihy93a
>>       bib/RCU: Append doi to ThomasEHart2006a
>>       bib/syncrefs: Append doi to WilsonCHsieh92a
>>       bib/refs: Append doi to VanJacobson88
>>       bib/TM: Append doi to ChristianJacobi2012MainframeTM
>>       bib/TM: Append doi to SanjeevKumar2006
>>       bib/RCU: Append doi to Kung80
>>       bib/syncrefs: Append doi to Lamport74a
>>       bib/refs: Append doi to McKenney90
>>       bib/perfmeas: Append doi to McKenney95a
>>       bib/syncrefs: Append doi to McKenney96a
>>       bib/syncrefs: Append doi to MellorCrummey91a
>>       bib/os: Append doi to McKenney92b
>>       bib/os: Append doi to McKenney92a
>>       bib/hw: Append doi to MiloMKMartin2012scale
>>       bib/TM: Append doi to PaulEMcKenney2010OSRGrassGreener
>>       bib/WFS: Append doi to MichaelScott96
>>       bib/os: Append doi to McKenney01e
>>       bib/parallelsys: Append doi to Olukotun96
>>       bib/TM: Append doi to ChistopherJRossbach2007a
>>       bib/hw: Append doi to DanielJSorin2011MemModel
>>       bib/syncrefs: Append doi to Segall84
>>       bib/parallelsys: Append doi to DuaneSzafron1994PEMPDS
>>       bib/TM: Append doi to JMStone93
>>       bib/TM: Append doi to Shavit95
>>       bib/syncrefs: Append doi to Takada:1995:RSN:527074.828566
>>       bib/WFS: Append doi to Valois95a
>>       bib/syncrefs: Append doi to Wisniewski94
>>       bib/syncrefs: Append doi to Cai-DongWang1996PrioInherLock
>>
>>  bib/RCU.bib         |  4 ++++
>>  bib/TM.bib          | 11 +++++++++++
>>  bib/WFS.bib         |  5 +++++
>>  bib/hw.bib          |  2 ++
>>  bib/os.bib          |  4 ++++
>>  bib/parallelsys.bib |  3 +++
>>  bib/perfmeas.bib    |  2 ++
>>  bib/refs.bib        |  2 ++
>>  bib/swtools.bib     |  2 ++
>>  bib/syncrefs.bib    | 15 +++++++++++++++
>>  10 files changed, 50 insertions(+)
>>
> 
> 

