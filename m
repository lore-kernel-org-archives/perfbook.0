Return-Path: <SRS0=0yOs=GC=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=zYPcdnS+FLfj6DaSrCM4FE0BkZZXsftNQPeHDhsbodw=;
        b=FQVcKjpj2vsbSpeUpXFDScAZR1LkOM9XwxSMCCH1aDUesePoCKGuvgptjmHj5Wiqow
         61IBLYl79U4wBmksyfS0UXzmQOD22mhqx/kvI8drLauYcNrPrpZnBckWnA8oFFL15aO7
         DAUJss9bNN+GjvX01F8+Bhxyk7pHg4pdm3P/MaIN/CGEKKMopo7dHdErbzdFD3jBx21a
         uJITktpQKrDhfWiOfnrT5mwMWtbUaZrl3551/KsFb3t4m+lmgTTixGt2yLwUcQ0aJAHG
         TRRUh6rh23vPkCgzAYYNEqkyAtpa5K8hqDWbRXQ7s8Z+axNvWdLsY7ErU8fBTVqxyP0L
         MqxQ==
Subject: Re: FYI, Second Edition Release Candidate 1 now available
References: <20201230053728.GA31231@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <38c34066-da73-eecc-cbd6-4e24db5ab367@gmail.com>
Date: Wed, 30 Dec 2020 20:44:30 +0900
MIME-Version: 1.0
In-Reply-To: <20201230053728.GA31231@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

On Tue, 29 Dec 2020 21:37:28 -0800, Paul E. McKenney wrote:
> Hello!
> 
> Release Candidate 1 of the Second Edition is now available, and I have
> started a prototype blog entry: https://paulmck.livejournal.com/59935.html
> Please let me know of any omissions or errors in this blog entry.

Wouldn't it be worth while mentioning the availability of the "nq" build
targets?

        Thanks, Akira

PS:

My experiment on index annotations is progressing but slowly.
Besides the hierarchical indexing, I'm attempting to make use of
the "glossaries" or the "glossaries-extra" package to manage indexing
of acronyms.
Once it becomes stable enough, I'll submit an RFC pull request.
That would be after the release of Second Edition.  

>                                                                    I expect
> to post it to my social media accounts in a few days.
> 
> And thank you all for your interest in and contributions to perfbook!
> 
> 							Thanx, Paul
> 
