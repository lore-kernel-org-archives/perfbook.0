Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=0HgkLR56yfHz6XmwiNr94yd/DQTTqkJwNtvYO3RzwLA=;
 b=XXXj8VzGVXhswznCX2iQIeVzjHcHCs3149y3jPfWgjYI4zaseJbY262dIxEWw9H4fz
 8lGfvrzS07g7z5owWiptegaCPY/5EZU7EJYNayY8vQOyK9h0x875rh5o1ibMEVfN9W6M
 +h+1e0dvLBkucmbiJ4WEyai9tmle0CfNJ2rtMmjcRISJiB9C8LuEAX0o45rXFlRFj/8L
 8vpKRciwu/KvZaB36PS35JZHGXSCnJQ/NYgf3NVCn772oQUvHYj/LAmAeN/FsNIbLZRD
 ahu7wikMx23qNN6wCCEMQXLycwKyNorTn7tJqEctgH8gAMU015/FWz0jZW4Vlxl1NfgW
 2mWA==
Subject: Re: Some questions
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
Date: Thu, 28 Apr 2016 07:15:05 +0900
MIME-Version: 1.0
In-Reply-To: <20160427165357.GD4967@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
> On Thu, Apr 28, 2016 at 12:21:48AM +0900, Akira Yokosawa wrote:
> [snip]
> 
>> However, the newly added Table 14.2 "A Variable With More Simultaneous Values"
>> seems like it is not complete yet.  Is that the case?
> 
> Please see attached for what it looks like to me.

Well, this is identical to the one I built.
So, do you intend to explicitly put numbers which show up fairly long time, and
leave other cells blank even below changes of values denoted by (n) in italics?

> 
>> Looks like you used some custom script or something to generate the table
>> from a raw data that contains when each cpu sees the updates.
>>
>> Do you have a plan to replace the Table with a Figure something like
>> Figure 14.5 "A Variable With Multiple Simultaneous Values"?
> 
> I briefly considered coloring the table cells, but got distracted.

That kind of work would be made easy if you make a script or something to
generate the latex source of the table. The problem is the script itself
might take time to make it work properly. I could be of help in that area. 

> 
> I am not sure that making a 14.5-like barchart would be all that
> readable...  But please feel free to prove me wrong.

There would be a number of very narrow bars hard to recognize.
It would also be impossible to see there are fourteen different opinions
at time 20. Yes, a table seems a better way to represent this.

> 
>> If you do, I'll refrain from touching the Table. Rather, I'd be interested
>> in improving the script you might be using, if any.
>>
>> Another totally unrelated question is about the URL you placed in
>> Section C.7: "http://www.openvms.compaq.com/wizard/wiz_2637.html".
>> Sadly, this URL is no longer valid. Do you happen to aware of an alternative
>> URL still accessible today?
> 
> This one: http://h71000.www7.hp.com/wizard/wiz_2637.html
> 
>> By looking up a Wikipedia article, I found a page at
>> http://h18002.www1.hp.com/alphaserver/technology/chip-docs.html,
>> which is "Archived technical documentation library" of Alpha
>> containing links to technical documentation for Alpha microprocessors
>> and Alpha ATX motherboards. Is there a document there which can be
>> referred to instead of the above mentioned URL?
> 
> Ah, I see...  I blew it and included the URL verbatim in the text.
> It should be replaced with \cite{Compaq01}.
> 
> Fixed, with your Reported-by!  Thank you!

Oh, you are most welcome!
                                                   Thanks, Akira
> 
> 							Thanx, Paul
> 

