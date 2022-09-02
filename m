Return-Path: <SRS0=1NbL=ZF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=EYqrd1YwmADaegYpm0LhbOBKqcGgoXkPvQWWS5+AI7g=;
        b=BwZ6Gh7thpoRYtRuV3ohaYc/JTo6u6ik/W9bmnwGHzH75/UeAIuebVAmenYRqEk7O5
         a6fwVvwGhcpQ63xFMDTF+lEfiEsJzsCaBvzUDBpaYJoITAVyDmxJUFbEUu50YqWygh4V
         /N9taOIBV4hsYBwbTRVOdbbBoXpht6rEs15JbNYnRswqThfp/8xRSLG/VbZquiSRAUfn
         5ZWolUdNFiVgpunuZtHWMV0/XUf1tfgJ4eg0jgnQVZLRDeZHz7LBbpX7zowJRidA/kDP
         aP8avsThwi8/iMvg+ReinO1ij9omxxM3H08cy7vX96v4bxEYBJinyCK4sU85isii5mf+
         riqA==
Message-ID: <b815fab4-295a-a0e9-b92a-92a5f71359db@gmail.com>
Date: Fri, 2 Sep 2022 10:00:24 +0900
MIME-Version: 1.0
Subject: Re: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Content-Language: en-US
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
 <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
 <e03292ee-f379-c8c5-62af-766ac76644ed@gmail.com>
 <20220901164207.GY6159@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220901164207.GY6159@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 1 Sep 2022 09:42:07 -0700, Paul E. McKenney wrote:
> On Fri, Sep 02, 2022 at 12:18:11AM +0900, Akira Yokosawa wrote:
>> On Thu, 1 Sep 2022 22:47:22 +0900, Akira Yokosawa wrote:
[...]
>>> --- a/datastruct/datastruct.tex
>>> +++ b/datastruct/datastruct.tex
>>> @@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
>>>  Fortunately, the relatively large memories available on modern
>>>  systems have allowed us to prioritize performance and simplicity
>>>  over memory overhead.
>>> -However, even with today's large-memory systems\footnote{
>>> +However, even with today's large-memory systems,\footnote{
>>>  	Smartphones with gigabytes of memory, anyone?}
>> Paul, you might want to update the text of this footnote.
>> Today's smartphones actually have gigabytes of memory...
> 
> Indeed, that was supposed to serve as an example.  For example, back
> in the day, one might respond to the assertion "All ports serving
> ocean-going ships are saltwater ports" with "Portland, Oregon, anyone?",
> thus sarcastically pointing out the fact that the Columbia and Willamette
> rivers between the Pacific Ocean and the Port of Portland's Terminal 6
> can both accommodate the ocean-going ships of the 1970s.  (Probably not
> today's much larger ships, though.  Plus the Port of Portland isn't what
> it used to be.)
Ah, now I think I see the sarcasm.

> 
> But you are right, that is not going to be at all clear to all native
> English speakers, let alone non-native English speakers.Looking at the git history, this particular footnote once read:

    Smartphones with hundreds of gigabytes of memory, anyone?

after commit 6d4f16cc4c5b ("datastruct: Update an outdated footnote").
You reverted the change in commit 0d4e8640abf ("datastruct: Updates
and wordsmithing, take two.").

Weren't you confused when you took 6d4f16cc4c5b ???

> 
> So I eliminated that footnote and rewrote that sentence as follows:
> 
> 	However, even though the year~2022's pocket-sized smartphones
> 	sport many gigabytes of memory and its mid-range servers sport
> 	terabytes, it is sometimes necessary to take extreme measures
> 	to reduce memory overhead.
> 
> Does that help?

Yes. It is clearer now and no worry of confusion.

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>>         Thanks, Akira
>>
>>>  it is sometimes necessary to take extreme measures to reduce
>>>  memory overhead.
>> [...]
