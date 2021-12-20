Return-Path: <SRS0=B9ic=RF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kgjGyEZqdgF69B2pBr3kCeL/CHn2i2X4XqjxwvfgTgE=;
        b=goYQ5eO8JXj8SXEwvouEvNVMOLy4nDbWFuU5MpT9aIpZPwyLyq+C47YXQgyVkFHHF2
         N3Snx3pW10U6Bc9JeQepiMi20DXGztQwdscsgFRhpb6ncEpPOp4QTfIex67gmgTkbNRD
         NPLs57jtGI7wA5XWIq2durX7nzbY4q+V6LgrMXoZUeqE3PJlxUvG8fhNbL5/FhA7ZhML
         /s77527i/nM7rw5LGpHrhKuz1cH/0Q+Pj8fg/VfLkgmK2cuAXeeOn+gGxi9eohv9DZgj
         tWllnoUqM6kH1bnFRsHHYbRVRJy8SXL1N7jHmHtnhvGEpKCBpUShW49nsdNXsDdTUhrt
         NRJA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: A few terms I'd like to see in perfbook's Glossary
Message-ID: <e2fcb255-aeba-7d72-a160-5573c5e2455e@gmail.com>
Date: Mon, 20 Dec 2021 18:55:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

While reading through Section 9.5.4, I noticed a few terms
I'd like to see in perfbook's Glossary.

 - Reference Counter/Counting
 - Existence Guarantee
 - Type-safe Memory

"Reference counter" is already mentioned in a couple of existing
items in the glossary.

"Existing guarantee" might be obvious enough and not worthy
to be in the glossary.

Thoughts?

There were only a few minor nits in the section.
Will post a patch taking care of them.

        Thanks, Akira
