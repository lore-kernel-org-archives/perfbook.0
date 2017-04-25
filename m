Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:34093 "EHLO
 mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1947611AbdDYNCj (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 25
 Apr 2017 09:02:39 -0400
Received: by mail-pf0-f174.google.com with SMTP id c198so26736819pfc.1 for
 <perfbook@vger.kernel.org>; Tue, 25 Apr 2017 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=7idDmR9MjnmR9q4Neo6AiEHsm2fi/J0xsh3nhpZo7VM=;
 b=CoK+dAVLDPhOu8hf8eD+vX5ZaE5NZDjajCdqYD1tYlXXJjknDJ8EFsO+GDoL7vZyY+
 sSS8aJAVNYCG+268hrV/Bm+ga1vz3XaAzdRZBhQR9t9O31GEzvda/U9KB76JDt6YPTXL
 F2qWS1lB6x7GetW6gRn+e6muHfVJKrFJVEyFrx+hyFiCiU7ABfPWW+/vX5vdl/P1zMZH
 BrKp516gniQnBIK5D/hliOIiSFAeTpHm9KM7vkBcBAnwpgoCygfVHjTk64hugY2HnAT6
 g/Nql3XxHXOQOvHCsIciS/8iM4Sn1B3d7hv44BWM+JpyVKs8qksBXn00KozX3Ln2V4Wh
 yBoA==
Received: from master ([116.56.129.146]) by smtp.gmail.com with ESMTPSA id
 g89sm36679159pfk.25.2017.04.25.06.02.36 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128); Tue, 25 Apr 2017 06:02:37
 -0700 (PDT)
Date: Tue, 25 Apr 2017 21:02:22 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Some question about memory model(consistency)
Message-ID: <20170425130222.GA21476@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,
long time no see :)

This email relates to some confusion about computer system memory model.
Recently I spent sometime reading stuff about momery model and finally I get
to the subject of safety properties of concurrent data structure. When
discussing concurrent data structures, three important properties are proposed:
    1. quiescent consistency
    2. sequential consistency
    3. linearizability

But...hmm...I don't fully understand them. sad :(
I know there might be someone in this lists to discuss these questions with, so
I try to post them here. Any feedback is welcome.

Let's start with some simple concepts to make this communication valid.

1. what exactly counts as a "Quiescence"?
-------
I understand the concept of quiescent consistency: An execution of a
concurrent program is quiescently consistent if the method calls can be
correctly arranged while still retaining the mutual order of calls
separated by quiescence, a period of time where no method is being
called in any thread

Basically it can be illustrated very vividedly by the following figures:

    Program order specified:
        <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
                              ~~~~~~~
                          (quiescence point)

    Real execution order:
        <--A--> <--C--> <--B-->   <--E--> <--D--> <--F-->
                              ~~~~~~~
                          (quiescence point)

The above model is quiescent consistent because there is no execution
reordering across the quiescence point. But this one is not:

    Program order specified:
        <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
                              ~~~~~~~
                          (quiescence point)

    Real execution order:
        <--A--> <--B--> <--D-->   <--C--> <--E--> <--F-->
                              ~~~~~~~
                          (quiescence point)

This one is NOT quiescent consistent because the reordering of D and E
across the quiescent point.

But, in real world program, how can we identify those quiescent points?
I mean, in a program like this:

  1: q.enqueue(something)
  2:
  3: q.enqueue(something)
  4:
  5: k.enqueue(something)
  6:
  7: k.dequeue(something)

which is a quiescent point/period? Is it 2 or 4 or 6?

I am not so a hardware guy and I don't have so much experience with memory
model. But I am really interested in these models because I think it
provides foundation for concurrent programming and distributed system
building, which is what I interested in.

Any feedback is welcome :)

Thanks
Yubin
