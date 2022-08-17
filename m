Return-Path: <SRS0=WSP0=YV=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=B7nwYLMy3dZCl70YPAJhf8TC4SFKZORYPi3xMOHBT0k=;
        b=Qmr+IaqrJZEzRj9R7HzAZfl9ysaRvRUWP5XmX5CSlpk/FqpUft+aF+j3/sO2F2Nc1P
         b3n4ibRK/sjDrmsOkitxwAUG50tQKULApN7xXOywQpzZ8Y1HwzQf0J79IQQ6dVqGeBlY
         QIE0bkNUBVndbiWaFsDeu0NigdZOUA3MgYE9AuwSV7WzcmVWkM3CikDAsqjQctSbrN4E
         3rQ9aOnQ874JV/XXIzdGEDi6u0x2K4+bjrD0ElhmXCOclcwQ2X0kHeODpdLsxwQJ9ghy
         cfzClGZc0U78kRdQsvb+U0KvSi0dbYNEn0Ux4lLNvxECPMn2H8s7f1RLD0vgWQ3SiaUw
         d3wg==
Message-ID: <c5a270d7-d19d-1f54-41f4-e44fb7a0ea43@gmail.com>
Date: Wed, 17 Aug 2022 07:02:45 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Language: en-CA
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
In-Reply-To: <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2022-08-13 19:08, Paul E. McKenney wrote:
> On Sat, Aug 13, 2022 at 07:45:59AM -0400, Elad Lahav wrote:
>> Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> 
> Nice, thank you!
> 
> But did you verify that none of the text describing count_end.c needed
> changing?  (It seems unlikely that any would, but could you please check?)

Indeed there were such references. Updated.

> Could you please mention __thread as the old way?  Either in the text
> directly, in parentheses, as a footnote, or as a quick quiz, your choice.

Done. See v2.

--Elad
