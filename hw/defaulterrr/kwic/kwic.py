from typing import List, MutableSet, FrozenSet
from concord import Concord, IndexedConcord, ReadyConcord, read_concords
from dataclasses import dataclass

import logging

class KWICSharedSolver():
    input: List[Concord]
    keywords: MutableSet[str]
    stopwords: MutableSet[str]

    shifted_concords: List[ReadyConcord]
    sorted_concords: List[ReadyConcord]
    
    def __init__(
        self,
        input: List[str],
        keywords: MutableSet[str],
        stopwords: MutableSet[str]
    ) -> None:
        self.input = read_concords(input)
        self.keywords = keywords
        self.stopwords = stopwords
    
    def solve(self) -> List[ReadyConcord]:
        self.keywords = get_keywords(
            self.input,
            self.keywords,
            self.stopwords,
        )

        self.shifted_concords = self.circular_shift()

        self.sorted_concords = sorted(self.shifted_concords,key= lambda x: x.keyword)

        return self.sorted_concords

    def circular_shift(
        self
    ) -> List[ReadyConcord]:
        out = []    

        for concord in self.input:
            temp = self.circular_shift_single(concord)
            for t in temp:
                out.append(t)

        return out

    def circular_shift_single(
        self,
        concord: Concord,
    ) -> List[ReadyConcord]:
        words = [x.strip() for x in concord.line.split(" ") ]
        logging.debug(f"circular_shift_single:keywords: {self.keywords}")
        logging.debug(f"circular_shift_single:words: {words}")
        out = []

        for windex, word in enumerate(words):
            if word.lower() not in self.keywords:
                logging.debug(f"circular_shift_single:words: skipping word {word}")
                continue

            rconc = ReadyConcord(
                keyword=word.upper(),
                index=concord.index,
                before_phrase=" ".join([x for x in words[:windex]]).strip(),
                after_phrase=" ".join([x for x in words[windex+1:]]).strip()
            )
            
            logging.debug(f"circular_shift_single:windex: {windex}")

            out.append(rconc)

        return out




# def kwic(
#     input: List[Concord],
#     keywords: MutableSet[str],
#     stopwords: MutableSet[str],
# ) -> List[ReadyConcord]:
#     logging.debug(f"input: {input}, kws: {keywords}, sws: {stopwords}")
#     kws = get_keywords(input, keywords, stopwords)
#     stopwords = [x.lower() for x in stopwords]

#     something = get_keywords(input, kws, stopwords)

#     logging.debug(f"kwic:keywords: {kws}")
#     logging.debug(f"kwic:stopwords: {stopwords}")
#     logging.debug(f"kwic:something: {something}")

#     ready_concords = circular_shift(input, kws, stopwords)

#     ready_concords.sort(key= lambda x: x.keyword)

#     return ready_concords



def get_keywords(
    input: List[Concord],
    given_keywords: MutableSet[str],
    given_stopwords: MutableSet[str]
) -> MutableSet[str]:
    logging.debug(f"input: {input}, kws: {given_keywords}, sws: {given_stopwords}")

    keywords: MutableSet[str] = set()

    for concord in input:
        words = concord.line.split(" ")
        for word in words:
            if word not in given_stopwords:
                keywords.add(word.strip())

    for given_keyword in given_keywords:
        keywords.add(given_keyword)

    keywords = [x.lower() for x in keywords]

    return keywords
